# Overview — PowerShell Scripting & SC‑200 Preparation

Recently I’ve been spending a lot of time building PowerShell scripts that query the Microsoft Graph API to pull **Defender** and **Intune** data. I kept running into edge cases and inefficiencies, which led me to refine both my tooling and my understanding of the platform.

Repository link:  
https://github.com/wwd9135/Projects/tree/main/PowerShell_Projects/EndpointCompliance/Get-IntuneComplianceReport

The core design goal of this script is **flexibility**: it accepts a list of devices in **CSV format**, intentionally so that output from Excel, Defender, Intune, or Sentinel can be used *as-is*, without any prior normalisation or transformation.

---

## PowerShell Scripts

I initially created a script that scans **all devices** in an Intune tenant and pulls high‑level compliance and inventory data, including management type and OS details. Below is a **sample (anonymised) output**:

```text
DeviceName                 : WKSTN-83F2Q9
DeviceId                   : 9b2f41a7-8d14-4c0e-9d62-3a1e78c4f6de
UserPrincipalName          : alex.patel@examplecorp.co.uk
Platform                   : Windows
OSVersion                  : 10.0.26100.3037
ComplianceState            : noncompliant
LastSyncDateTime           : 14/02/2026 10:42:18
EnrollmentDateTime         : 05/10/2025 09:21:04
ManagementAgent            : mdmAndConfigMgr
DeviceType                 :
Manufacturer               : HP
Model                      : EliteBook 840 G10
SerialNumber               : 83F2Q9
TotalStorageSpaceInBytes   : 512110190592
FreeStorageSpaceInBytes    : 341728927744
CompliancePoliciesCount    : 2
ConfigurationPoliciesCount : 6
IsEncrypted                : True
IsSupervised               : False
ExchangeAccessState        : allowed
ExchangeAccessStateReason  : compliant

I decided that querying the entire Intune tenant for this level of detail was too bulky and inefficient for regular use. In most practical scenarios (incident response, audits, investigations), only a subset of devices is relevant.
To address this, I added an initial filtering mechanism based on hostnames, allowing the script to consume a CSV list of devices and only query those endpoints. This approach dramatically reduces unnecessary Graph API calls and makes the script much more suitable for real‑world SecOps workflows.
## Planned Enhancements
The next iteration will introduce parameter‑driven filtering, allowing targeted queries based on specific device attributes present in the output above.
### Example usage intent:
Get-ComplianceReport.ps1 -Platform Windows -Model "EliteBook 840 G10"Show more lines
This will allow filtering by attributes such as:
- Platform
- Model
- Manufacturer
- Compliance state
- Management agent

Implementing this is straightforward; the main work is identifying which fields should be supported and handling edge cases (e.g. null values, multiple results, inconsistent casing).

## SC‑200 Preparation
I’ve booked the SC‑200 (Microsoft Security Operations Analyst) exam for two weeks’ time. I initially came across one of the official labs and learning paths and found the content genuinely interesting and directly applicable to what I’m doing day‑to‑day.
Alongside this, I’m now spending 2 days per week working with the CSOC for the remainder of my placement. Achieving SC‑200 will allow me to contribute more effectively to SOC operations, and my goal is to deliver a couple of small but meaningful improvements, such as:
- SIEM alert tuning
- Improving log quality and enrichment within the SIEM

So far, I’ve completed the Defender XDR and Security Copilot modules and labs. I’m now working through Defender for Cloud, Microsoft Defender for Endpoint, and Defender for Identity, focusing on how telemetry flows into investigations and how it can be correlated effectively in a SOC context.
