# Weekly Overview – SecOps Exposure & SC-200 Preparation

This week focused on hands-on security operations, building out Azure environments from scratch, and working extensively with Atomic Red Team. Alongside this, I continued preparing for the SC-200 certification through practical implementation rather than just theory.

---

## Security Operations (SecOps) Experience

I rotated into the SecOps team this week with the goal of understanding real operational pain points within the organisation. This proved highly valuable.

At a high level, the SOC is still relatively immature, which created a strong learning opportunity. I spent time understanding:
- The tools currently in use
- Existing processes and workflows
- How different teams interact during incident handling

### Key Observations

- **Underutilisation of Security Tooling**  
  Several high-cost security tools are not being fully leveraged. In particular, data ingestion into Microsoft Sentinel is inconsistent, limiting visibility and detection capability.

- **Overreliance on Poorly Tuned Detection Sources**  
  There is heavy dependence on signals from UEBA, AV, and NDR solutions. These controls are not well tuned, resulting in:
  - High false positive rates  
  - Increased likelihood of missing relevant attacker TTPs  

- **Lack of Proactive Security Practices (Improving Area)**  
  Historically, the SOC has been reactive. However, this is beginning to change:
  - Threat hunting is becoming more regular  
  - There is a shift toward using **relevant, industry-aligned TTPs** (e.g., government infrastructure patterns) instead of generic detection coverage  

Overall, the direction is improving, but there is still a gap between tooling capability and actual operational effectiveness.

---

## SC-200 Preparation (Microsoft Security Operations Analyst)

Alongside SecOps exposure, I have been heavily focused on preparing for the SC-200 exam through hands-on lab work.

### Current Approach

- **Azure Lab Environment**
  - Built a fully functional Azure tenant from scratch  
  - Deployed virtual machines for controlled testing  

- **Atomic Red Team Testing**
  - Installed Atomic Red Team on test VMs  
  - Executing simulations on audit-only devices to capture full telemetry  
  - Analysing what an attacker could achieve before enforcement kicks in  

- **Microsoft Sentinel Integration**
  - Ingesting logs via Microsoft Defender for Endpoint (MDE)  
  - Building custom analytic rules to detect simulated activity  

- **Detection & Response Engineering**
  - Creating incidents based on analytic rules  
  - Developing playbooks for automated response  

- **Threat Hunting & Advanced Features**
  - Experimenting with:
    - Threat hunting queries  
    - Notebooks  
    - Watchlists  

---

## Outlook

This approach—combining real-world SecOps exposure with controlled attack simulation and detection engineering—puts me in a strong position for the SC-200 exam.

More importantly, it’s building practical skills that translate directly into improving SOC capability, not just passing a certification.
