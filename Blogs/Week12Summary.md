# Week 12 Overview – Work & Interview Preparation

This week was heavily work‑focused, leaving very little room for personal projects. Most of my time went into reviewing our MECM configuration and security baselines and determining which of them should be migrated to Intune and removed from our on‑prem infrastructure.

Although it was a sizable task, it turned out to be surprisingly rewarding. I gained a much deeper understanding of how we currently assess device compliance and non‑compliance across the estate. It quickly became clear that many of the existing configuration baselines were outdated or no longer relevant to our modern setup.

These baselines were originally designed to feed into our daily checks, providing insight into fluctuations in compliance and highlighting high‑priority issues. After reviewing around **70 Configuration Items (CIs)**, I concluded that most of them can be retired. A select few will be rebuilt properly in Intune, and from there I’ll develop updated daily‑check reporting aligned with our newer, cleaner approach.

---

## Challenges Faced This Week

- **Learning the ropes of CIs**  
  The volume alone made this challenging. Switching contexts between so many configurations required a lot of focus and patience.

- **Planning and rebuilding policies in Intune**  
  Migrating from MECM to Intune wasn’t straightforward, but it was genuinely rewarding. Rebuilding these policies helped me understand our broader compliance engine more holistically—especially since I’m now involved in shaping the reporting side as well.

---
