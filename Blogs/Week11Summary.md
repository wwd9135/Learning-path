# WTFAF Project – Week 11 Update

## What I Built This Week

This week was packed with solid progress on my WTFAF triage tool and a lot of PowerShell/KQL engineering:

### Finalised Hashing & File Integrity  
I completed the hashing mechanism for WTFAF.  
- Every artefact produced by the PowerShell triage script now receives a guaranteed‑integrity hash.  
- The Python parser refuses to read files unless the hash matches **perfectly**, ensuring the evidence remains trustworthy, tamper‑proof, and courtroom‑ready.

### PowerShell & KQL Work  
A big chunk of my time was spent building tooling to make vulnerability hunting less painful:

- **Advanced KQL Hunt in Microsoft Defender:**  
  I created a query to detect a niche vuln involving registry keys missing quotation marks. This exposed discrepancies between Tenable and Defender’s vuln detection logic — both were scanning different criteria for the *same* vulnerability, generating false positives.

- **Group Policy Scanner:**  
  I wrote a PowerShell script that crawls all GPOs across the network, extracting specific keywords or exact policies. This dramatically cuts down the time spent hunting for registry keys or policy misconfigurations manually.

- **Intune/Graph API Policy Scanner:**  
  I built a script using Microsoft Graph API to pull Intune device data and inspect reg keys/policies. Perfect for organisations where policy management is… let’s say *chaotic*.

---

## What I Struggled With

The main challenge was enumerating vulnerability counts during advanced threat hunting in Defender.  
A lot of devices were placed in incorrect OUs — for example, **Windows Server 2019 machines sitting inside a 2022 OU**, pulling the wrong policies. This led to a flood of false positives and confusing configuration mismatches.

Understanding the internal structure (or lack thereof) was the hardest part.

---

## Outcomes & Next Steps

- **WTFAF Parsing Logic:**  
  I’ll be finishing the parsing engine, then drafting a roadmap for integrating an LLM — maybe even a custom one.

- **More Vulnerability Hunting:**  
  I’ll continue writing PowerShell tools and hunting down specific vulnerabilities to streamline workflows and tighten security posture.

- **Career Development & Networking:**  
  I spent time with a DevOps colleague who walked me through CI/CD pipelines and our organisation’s tooling. As I move into a more security‑focused role, I plan to meet with Linux and Network colleagues next to deepen my understanding across the stack.

---

Thanks for following along — more progress coming next week!
