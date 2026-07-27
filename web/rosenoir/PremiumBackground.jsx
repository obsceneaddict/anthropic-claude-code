'use client';

/**
 * Rose Noir — Premium Obsidian Background (React / Next.js port)
 *
 * Same engine as premium-bg.js, expressed as a component. Import
 * premium-bg.css (or paste it into your global stylesheet) alongside this.
 *
 *   import PremiumBackground from '@/components/PremiumBackground';
 *   import '@/styles/premium-bg.css';
 *
 *   export default function Layout({ children }) {
 *     return (
 *       <>
 *         <PremiumBackground />
 *         <div className="pbg-content">{children}</div>
 *       </>
 *     );
 *   }
 *
 * Deliberately does not use Framer Motion. Framer's spring drives React state
 * or motion values through its own rAF scheduler, which is the right tool for
 * component transitions but adds a dependency and a layer of indirection for
 * what is one loop writing one transform. Here the refs are mutated directly
 * and React never re-renders after mount — the animation never touches the
 * React tree at all, which is what keeps this free.
 */

import { useEffect, useRef } from 'react';

const SPRING = {
  near: { stiffness: 0.05, damping: 0.85 },
  far: { stiffness: 0.032, damping: 0.87 },
};
const EPSILON = 1.0;
const FADE_MS = 900;

export default function PremiumBackground() {
  const rootRef = useRef(null);
  const nearRef = useRef(null);
  const farRef = useRef(null);

  useEffect(() => {
    const near = nearRef.current;
    const far = farRef.current;
    const root = rootRef.current;
    if (!near || !far || !root) return;

    const fine = window.matchMedia('(pointer: fine)').matches;
    const reduced = window.matchMedia('(prefers-reduced-motion: reduce)').matches;

    if (!fine || reduced) {
      root.setAttribute('data-pointer', 'none');
      if (reduced) {
        const cx = window.innerWidth / 2;
        const cy = window.innerHeight * 0.42;
        const t = `translate3d(${cx}px,${cy}px,0)`;
        near.style.transform = t;
        far.style.transform = t;
      }
      return;
    }

    let targetX = window.innerWidth / 2;
    let targetY = window.innerHeight * 0.4;
    let seen = false;
    let running = false;
    let raf = 0;

    const s = {
      nx: targetX, ny: targetY, nvx: 0, nvy: 0,
      fx: targetX, fy: targetY, fvx: 0, fvy: 0,
    };

    const step = (axis, vAxis, target, k) => {
      const d = target - s[axis];
      s[vAxis] = (s[vAxis] + d * k.stiffness) * k.damping;
      s[axis] += s[vAxis];
      return Math.abs(s[vAxis]) + Math.abs(d);
    };

    const r = (v) => Math.round(v * 3) / 3;
    const paint = () => {
      near.style.transform = `translate3d(${r(s.nx)}px,${r(s.ny)}px,0)`;
      far.style.transform = `translate3d(${r(s.fx)}px,${r(s.fy)}px,0)`;
    };

    const frame = () => {
      let motion = 0;
      motion += step('nx', 'nvx', targetX, SPRING.near);
      motion += step('ny', 'nvy', targetY, SPRING.near);
      motion += step('fx', 'fvx', targetX, SPRING.far);
      motion += step('fy', 'fvy', targetY, SPRING.far);

      if (motion < EPSILON) {
        // A spring approaches asymptotically; snap the last sub-pixel and sleep.
        s.nx = s.fx = targetX;
        s.ny = s.fy = targetY;
        s.nvx = s.nvy = s.fvx = s.fvy = 0;
        paint();
        running = false;
        return;
      }

      paint();
      raf = requestAnimationFrame(frame);
    };

    const wake = () => {
      if (running) return;
      running = true;
      raf = requestAnimationFrame(frame);
    };

    const onMove = (e) => {
      targetX = e.clientX;
      targetY = e.clientY;
      if (!seen) {
        seen = true;
        s.nx = s.fx = targetX;
        s.ny = s.fy = targetY;
        near.style.transition = `opacity ${FADE_MS}ms ease`;
        far.style.transition = `opacity ${FADE_MS}ms ease`;
      }
      near.style.opacity = '1';
      far.style.opacity = '1';
      wake();
    };

    const onLeave = () => {
      near.style.opacity = '0';
      far.style.opacity = '0';
    };

    const onVisible = () => { if (!document.hidden) wake(); };

    window.addEventListener('pointermove', onMove, { passive: true });
    window.addEventListener('pointerdown', onMove, { passive: true });
    document.addEventListener('mouseleave', onLeave);
    window.addEventListener('blur', onLeave);
    document.addEventListener('visibilitychange', onVisible);

    return () => {
      cancelAnimationFrame(raf);
      window.removeEventListener('pointermove', onMove);
      window.removeEventListener('pointerdown', onMove);
      document.removeEventListener('mouseleave', onLeave);
      window.removeEventListener('blur', onLeave);
      document.removeEventListener('visibilitychange', onVisible);
    };
  }, []);

  return (
    <div className="pbg" ref={rootRef} aria-hidden="true">
      <div className="pbg__layer pbg__wine" />
      <div className="pbg__layer pbg__marble" />
      <div className="pbg__layer pbg__grain" />
      <div className="pbg__layer pbg__sheen" />
      <div className="pbg__reflect pbg__reflect--far" ref={farRef} />
      <div className="pbg__reflect pbg__reflect--near" ref={nearRef} />
      <div className="pbg__layer pbg__vignette" />
    </div>
  );
}
