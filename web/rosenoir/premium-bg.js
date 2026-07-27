/* ==========================================================================
   Rose Noir — Premium Obsidian Background
   Self-injecting. Drop the <link> and this <script> onto any page:

       <link rel="stylesheet" href="premium-bg.css">
       <script src="premium-bg.js" defer></script>

   It builds its own layer stack, so nothing needs to change in your markup.
   Content should carry `position: relative` (or the .pbg-content class) so it
   stacks above the slab.

   Why no WebGL: the reflection moves with translate3d only, which the browser
   handles on the compositor — no layout, no paint, no per-frame rasterisation.
   A shader canvas would repaint the whole viewport every frame to draw what is
   ultimately two soft radial gradients. This is both cheaper and steadier.

   Tunables live in window.PremiumBackground.config.
   ========================================================================== */

(function (global) {
  'use strict';

  var config = {
    /* Spring constants. Low stiffness + high damping = slow, weighted glide
       with no overshoot and no jitter. The two layers differ so the far
       reflection trails the near one, which is what creates depth. */
    /* The ratio between these two matters more than the absolute values — it
       is the near/far separation that reads as depth in the stone. */
    near: { stiffness: 0.050, damping: 0.85 },
    far:  { stiffness: 0.032, damping: 0.87 },

    /* Total remaining motion, in pixels, below which the spring is snapped to
       its target and the rAF loop stops. A spring approaches asymptotically,
       so without this the last fraction of a pixel keeps the loop alive for
       seconds after the cursor has stopped. At this threshold each axis is
       within ~0.25px — well under the 1/3px rounding, so the snap is
       invisible. */
    epsilon: 1.0,

    /* Fade the reflection out when the pointer leaves the window. */
    fadeMs: 900
  };

  var LAYERS = [
    'pbg__wine',
    'pbg__marble',
    'pbg__grain',
    'pbg__sheen'
  ];

  function build() {
    var root = document.createElement('div');
    root.className = 'pbg';
    root.setAttribute('aria-hidden', 'true');

    for (var i = 0; i < LAYERS.length; i++) {
      var l = document.createElement('div');
      l.className = 'pbg__layer ' + LAYERS[i];
      root.appendChild(l);
    }

    var far = document.createElement('div');
    far.className = 'pbg__reflect pbg__reflect--far';
    var near = document.createElement('div');
    near.className = 'pbg__reflect pbg__reflect--near';

    var vignette = document.createElement('div');
    vignette.className = 'pbg__layer pbg__vignette';

    root.appendChild(far);
    root.appendChild(near);
    root.appendChild(vignette);

    /* Insert as the first child so it sits behind everything without needing
       negative z-index, which would escape a stacking context on some pages. */
    document.body.insertBefore(root, document.body.firstChild);

    return { root: root, near: near, far: far };
  }

  function mount(options) {
    if (global.__pbgMounted) return global.__pbgMounted;
    if (options) {
      for (var k in options) if (Object.prototype.hasOwnProperty.call(options, k)) config[k] = options[k];
    }

    var el = build();

    var fine = global.matchMedia && global.matchMedia('(pointer: fine)').matches;
    var reduced = global.matchMedia && global.matchMedia('(prefers-reduced-motion: reduce)').matches;

    /* No mouse, or the visitor asked for less motion: let CSS handle it and
       never start a loop. */
    if (!fine || reduced) {
      el.root.setAttribute('data-pointer', 'none');
      if (reduced) {
        var cx = global.innerWidth / 2, cy = global.innerHeight * 0.42;
        el.near.style.transform = 'translate3d(' + cx + 'px,' + cy + 'px,0)';
        el.far.style.transform = 'translate3d(' + cx + 'px,' + cy + 'px,0)';
      }
      global.__pbgMounted = { el: el, running: false };
      return global.__pbgMounted;
    }

    var targetX = global.innerWidth / 2;
    var targetY = global.innerHeight * 0.4;

    var s = {
      nx: targetX, ny: targetY, nvx: 0, nvy: 0,
      fx: targetX, fy: targetY, fvx: 0, fvy: 0
    };

    var running = false;
    var seen = false;

    function step(state, axis, vAxis, target, k) {
      var d = target - state[axis];
      state[vAxis] = (state[vAxis] + d * k.stiffness) * k.damping;
      state[axis] += state[vAxis];
      return Math.abs(state[vAxis]) + Math.abs(d);
    }

    function paint() {
      /* Rounding to a third of a pixel keeps the transform stable without
         visible stepping — avoids sub-pixel churn on the compositor. */
      el.near.style.transform =
        'translate3d(' + (Math.round(s.nx * 3) / 3) + 'px,' + (Math.round(s.ny * 3) / 3) + 'px,0)';
      el.far.style.transform =
        'translate3d(' + (Math.round(s.fx * 3) / 3) + 'px,' + (Math.round(s.fy * 3) / 3) + 'px,0)';
    }

    function frame() {
      var motion = 0;
      motion += step(s, 'nx', 'nvx', targetX, config.near);
      motion += step(s, 'ny', 'nvy', targetY, config.near);
      motion += step(s, 'fx', 'fvx', targetX, config.far);
      motion += step(s, 'fy', 'fvy', targetY, config.far);

      if (motion < config.epsilon) {
        /* Snap the remaining sub-pixel distance and sleep. */
        s.nx = s.fx = targetX;
        s.ny = s.fy = targetY;
        s.nvx = s.nvy = s.fvx = s.fvy = 0;
        paint();
        running = false;
        return;
      }

      paint();
      requestAnimationFrame(frame);
    }

    function wake() {
      if (running) return;
      running = true;
      requestAnimationFrame(frame);
    }

    function onMove(e) {
      targetX = e.clientX;
      targetY = e.clientY;
      if (!seen) {
        seen = true;
        /* First sighting: drop both springs straight onto the cursor so the
           reflection doesn't come flying in from the corner. */
        s.nx = s.fx = targetX;
        s.ny = s.fy = targetY;
        el.near.style.transition = 'opacity ' + config.fadeMs + 'ms ease';
        el.far.style.transition = 'opacity ' + config.fadeMs + 'ms ease';
      }
      el.near.style.opacity = '1';
      el.far.style.opacity = '1';
      wake();
    }

    function onLeave() {
      el.near.style.opacity = '0';
      el.far.style.opacity = '0';
    }

    global.addEventListener('pointermove', onMove, { passive: true });
    global.addEventListener('pointerdown', onMove, { passive: true });
    document.addEventListener('mouseleave', onLeave);
    global.addEventListener('blur', onLeave);

    /* Pause entirely when the tab is hidden. */
    document.addEventListener('visibilitychange', function () {
      if (!document.hidden) wake();
    });

    global.__pbgMounted = {
      el: el,
      config: config,
      /* True only while the spring is still resolving. Useful for confirming
         the loop actually sleeps when the cursor is idle. */
      isRunning: function () { return running; },
      destroy: function () {
        global.removeEventListener('pointermove', onMove);
        global.removeEventListener('pointerdown', onMove);
        document.removeEventListener('mouseleave', onLeave);
        global.removeEventListener('blur', onLeave);
        if (el.root.parentNode) el.root.parentNode.removeChild(el.root);
        global.__pbgMounted = null;
      }
    };
    return global.__pbgMounted;
  }

  global.PremiumBackground = { mount: mount, config: config };

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', function () { mount(); });
  } else {
    mount();
  }
})(window);
