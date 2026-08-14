import { gsap } from 'gsap';
import { ScrollTrigger } from 'gsap/ScrollTrigger';

export function useScrollAnimation() {
  /**
   * Fade in and slide up an element when it enters the viewport.
   */
  function fadeInUp(el: HTMLElement | string, options?: { delay?: number; duration?: number; y?: number }) {
    const { delay = 0, duration = 0.8, y = 40 } = options ?? {};
    gsap.from(el, {
      y,
      opacity: 0,
      duration,
      delay,
      ease: 'power3.out',
      scrollTrigger: {
        trigger: el,
        start: 'top 85%',
        once: true,
      },
    });
  }

  /**
   * Stagger children of a parent element into view.
   */
  function staggerChildren(parent: HTMLElement | string, childSelector: string, options?: { stagger?: number; y?: number }) {
    const { stagger = 0.1, y = 30 } = options ?? {};
    gsap.from(`${typeof parent === 'string' ? parent : ''} ${childSelector}`, {
      y,
      opacity: 0,
      duration: 0.6,
      stagger,
      ease: 'power3.out',
      scrollTrigger: {
        trigger: parent,
        start: 'top 80%',
        once: true,
      },
    });
  }

  /**
   * Animate a counter from 0 to a target value.
   */
  function animateCounter(el: HTMLElement, target: number, options?: { duration?: number; suffix?: string }) {
    const { duration = 2, suffix = '' } = options ?? {};
    const obj = { value: 0 };
    gsap.to(obj, {
      value: target,
      duration,
      ease: 'power2.out',
      scrollTrigger: {
        trigger: el,
        start: 'top 85%',
        once: true,
      },
      onUpdate: () => {
        el.textContent = `${Math.round(obj.value)}${suffix}`;
      },
    });
  }

  /**
   * Draw a line (scaleY) as user scrolls through a section.
   */
  function drawLine(el: HTMLElement | string, triggerEl: HTMLElement | string) {
    gsap.fromTo(
      el,
      { scaleY: 0 },
      {
        scaleY: 1,
        ease: 'none',
        scrollTrigger: {
          trigger: triggerEl,
          start: 'top 60%',
          end: 'bottom 40%',
          scrub: 1,
        },
      },
    );
  }

  /**
   * Reveal a section's elements.
   */
  function revealSection(sectionEl: HTMLElement) {
    const children = sectionEl.querySelectorAll('[data-reveal]');
    children.forEach((child, i) => {
      gsap.from(child, {
        y: 30,
        opacity: 0,
        duration: 0.7,
        delay: i * 0.1,
        ease: 'power3.out',
        scrollTrigger: {
          trigger: child,
          start: 'top 85%',
          once: true,
        },
      });
    });
  }

  /**
   * Clean up all ScrollTrigger instances (call on unmount if needed).
   */
  function cleanup() {
    ScrollTrigger.getAll().forEach((t) => t.kill());
  }

  return {
    fadeInUp,
    staggerChildren,
    animateCounter,
    drawLine,
    revealSection,
    cleanup,
  };
}
