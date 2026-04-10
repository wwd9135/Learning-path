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
  - Onboarded to Microsoft Defender for Endpoint (MDE)
  - Used for attack simulation and telemetry generation

- **Microsoft Defender for Endpoint (MDE)**
  - Primary telemetry source (process, network, registry, logon events)
  - Configured in **audit-heavy mode** to maximise visibility

- **Microsoft Sentinel**
  - Central SIEM for log ingestion, detection, and investigation
  - Connected to MDE via the native data connector
### Data Ingestion & Tables

Key Sentinel tables used:

- `DeviceProcessEvents` → Process creation & command-line visibility  
- `DeviceNetworkEvents` → Outbound/inbound network connections  
- `DeviceLogonEvents` → Authentication activity  
- `DeviceFileEvents` → File creation/modification  
- `DeviceRegistryEvents` → Registry persistence & changes  

Focus was placed on **correlating across tables**, not relying on single-event detections.

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

Each detection follows a repeatable validation cycle:

Simulate Technique
Execute Atomic Red Team test
Capture Telemetry
Identify relevant tables and fields in Sentinel
Build Detection Logic
Write KQL query based on observed behaviour
Test Against Data
Confirm detection triggers on simulated attack
Check for noise against baseline activity
Tune
Reduce false positives (e.g. filtering admin activity)
Improve context (parent process, frequency, device role)
Incident & Automation Workflow
Analytic Rules
Scheduled rules created from KQL queries
Trigger incidents based on thresholds or patterns
Playbooks (Logic Apps)
Basic automation workflows:
Alert enrichment
Tagging suspicious hosts
Notification pipelines

Incident Flow

Detection Rule → Sentinel Incident → Playbook Trigger → Analyst Review
Threat Hunting Approach

Threat hunting performed directly in Sentinel using KQL:

Hypothesis-driven hunts
Example: “What does abnormal discovery behaviour look like in this environment?”
Techniques used:
Time-based clustering (summarize, bin())
Parent-child process tracing
Outlier detection (rare processes / commands)
Key Learnings
Single-event detections are weak
Context (frequency, sequence, parent process) is critical
Telemetry quality defines detection quality
Not all logs are equally useful—process + command-line data is high value
Audit-first approach is essential
Blocking too early hides valuable detection opportunities
False positives come from lack of context
Most noise was reduced by adding:
Frequency thresholds
Process lineage
Device role awareness

---

This is now strong enough that:
- A hiring manager can see **how you think**
- A detection engineer can see **you’re not guessing**
- And most importantly—you’ve shown **methodology, not just tools**

If you want to push it further later, add:
- One **failed detection** and why it failed  
- One **before vs after tuning example**  

That’s the kind of detail that separates you from everyone else doing “SC-200 labs.”
