# Overview
- Developed an azure tenant to support my SC200 certification attempt
- I made VM's, storage accounts, SQL databases.
- Configured full defender suite & sentinel workspace.
- Downloaded atomic red team onto a VM, enabled audit only mode on it.
- Ran a plethora of tests, simulating full attack chain.
- Created playbooks, analytical rules, threat hunted in sentinel to master KQL and use of sentinels tools.
## Navigation
- ![AuditMode](Assets/AuditMode.ps1)- Script to switch a windows endpoint into audit mode (prevent auto blocking of attack simulations)
- ![InternetExfilKQL](Assets/InternetExfil.kql)- KQL analytic rule used to scan internet exfiltration methods.
- ![SuspiciousProcessKQL](Assets/SuspiciousProcess.KQL)- KQL hunt for MITRE TTP 1059, suspicious command line executions.
- ![SentinelPlayBook](Assets\SentinelPlaybook.webp)- Sentinel playbook image, takes suspiciousProcess alert, automation rule triggers playbook- block user/IP informs analyst via email.
## Technical details

### Architecture Overview

The lab is built as a **closed Azure environment** to safely simulate attacker behaviour and validate detections.

**Core Components:**
- **Azure Virtual Machines (Windows 10/11)**
  - Onboarded to Microsoft XDR+ full defence suite.
  - Used for attack simulation and telemetry generation (Atomic red team)

- **Microsoft Defender XDR**
  - Full defender suite gathering realistic telemtry via MDE/MDI.
  - Configured in **audit mode** to maximise visibility

- **Microsoft Sentinel**
  - Central SIEM for log ingestion, detection, and investigation
  - Connected to XDR via the native data connector
### Data Ingestion & Tables

Key Sentinel tables used in analytic rules/ Advanced hunting:

- `DeviceProcessEvents` → Process creation & command-line visibility  
- `DeviceNetworkEvents` → Outbound/inbound network connections  
- `DeviceLogonEvents` → Authentication activity  
- `DeviceFileEvents` → File creation/modification  
- `DeviceRegistryEvents` → Registry persistence & changes  
- `AuditLogs` → Sign in/cloud event logs.

Focus was placed on **correlating across tables**, not relying on single-event detections, also utilizing aggregate alerts/ UEBA as opposed to soley single event alerts.

---

### Atomic Red Team Execution

- Installed Atomic Red Team on a test VM
- Executed tests mapped to **MITRE ATT&CK techniques**, including:
- Discovery (`T1087`, `T1018`)
- Credential Access (`T1003`)
- Execution (`T1059`)
- Persistence (`T1547`)

**Approach:**
- Run tests in **audit-only context** to avoid blocking
- Capture full telemetry before prevention mechanisms interfere
- Record:
- Process trees  
- Command-line arguments  
- Parent-child relationships  

---
## Reflection
This labs purpose was to simulate a realistic corporate network and environment, then generate telemtry that was as realistic as possible, I then aimed to mitigate this telemtry, creating analytic rules to create incidents & automation rules to trigger remediation playbooks. was able to configure purview DLP, NRT hunting rules to find any cases of data exfil or malicious insiders, this taught me about threat hunting & detection engineering. Outside of this I learned the value of strong threat intelligence and how its vital to making valid decisions and creating robust detections. A key standout for me however was being able to apply my knowledge of painpoints in an SOC (From work), I really got a feel for the importance of creating detections that minimize false positives, and providing analysts with as much information as possible to inform their decisions, an example would be plugging into threat intel sources as part of the playbook/ remediation process, I used common tools like defender deep scan on files/ IPvoid to scan domains/ IPs, this helped in two key instances-
- 1- Enriching reports before the analyst read them- reducing the time taken  to understand the threat and decide next steps.
- 2- Automating the response if the data proved the threat was high risk/ known malicious file hash/ IP/ Domain etc.

## Logic:

- Encoded commands are commonly used for obfuscation
- Detection focuses on behavioural intent, not payload content
- Detection Validation Methodology

Incident Flow

Detection Rule → Sentinel Incident → Playbook Trigger → Analyst Review
