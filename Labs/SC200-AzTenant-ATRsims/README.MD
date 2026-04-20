# Overview
- Developed an azure tenant to support my SC200 certification attempt
- I made VM's, storage accounts, SQL databases.
- Configured full defender suite & sentinel workspace.
- Downloaded atomic red team onto a VM, enabled audit only mode on it.
- Ran a plethora of tests, simulating full attack chain.
- Created playbooks, analytical rules, threat hunted in sentinel to master KQL and use of sentinels tools.

## Technical details

### Architecture Overview

The lab is built as a **closed Azure environment** to safely simulate attacker behaviour and validate detections.

**Core Components:**
- **Azure Virtual Machines (Windows 10/11)**
  - Onboarded to Microsoft XDR+ full defence suite.
  - Used for attack simulation and telemetry generation (Atomic red team)

- **Microsoft Defender for Endpoint (MDE)**
  - Primary telemetry source (process, network, registry, logon events)
  - Configured in **audit-heavy mode** to maximise visibility

- **Microsoft Sentinel**
  - Central SIEM for log ingestion, detection, and investigation
  - Connected to MDE via the native data connector
### Data Ingestion & Tables

Key Sentinel tables used in analytic rules/ Advanced hunting:

- `DeviceProcessEvents` → Process creation & command-line visibility  
- `DeviceNetworkEvents` → Outbound/inbound network connections  
- `DeviceLogonEvents` → Authentication activity  
- `DeviceFileEvents` → File creation/modification  
- `DeviceRegistryEvents` → Registry persistence & changes  

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

### Detection Engineering Approach

Detections were built using **KQL in Sentinel**, focusing on behavioural patterns rather than static indicators.

#### Example: Suspicious Discovery Commands

# TODO - turn these into KQL code boxes.
DeviceProcessEvents
| where Timestamp > ago(1h)
| where FileName in~ ("whoami.exe", "net.exe", "ipconfig.exe")
| where ProcessCommandLine has_any ("user", "group", "/all")
| summarize count(), makeset(ProcessCommandLine) by DeviceName, InitiatingProcessFileName
| where count_ > 5

Example: Encoded PowerShell Execution
DeviceProcessEvents
| where FileName =~ "powershell.exe"
| where ProcessCommandLine has "-enc" or ProcessCommandLine has "-encodedcommand"
| project Timestamp, DeviceName, ProcessCommandLine, InitiatingProcessFileName

## Logic:

- Encoded commands are commonly used for obfuscation
- Detection focuses on behavioural intent, not payload content
- Detection Validation Methodology

Incident Flow

Detection Rule → Sentinel Incident → Playbook Trigger → Analyst Review
Threat Hunting Approach
