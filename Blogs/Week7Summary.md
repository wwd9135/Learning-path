# Project Writeup: Automation & Quality Assurance
## Week 7: Scaling Security Operations via Graph API and Pytest

This week focused on two pillars of engineering: **automated remediation at scale** and **formalized software testing**. I moved away from manual "spot-checking" toward building high-bandwidth automation for the Met Office's 4,500+ device estate.

### Technical Deep Dive: Bridging the "Data Silo" Gap
I addressed a critical bottleneck where 120 devices were failing to receive patches. The original manual plan was estimated to take dozens of man-hours; I chose to automate the entire triage pipeline using PowerShell and cross-platform APIs.

**The Multi-Source Integration:**
- **Microsoft Graph & KQL:** Leveraged Advanced Hunting (KQL) and the Graph API to pull live telemetry from Defender for Endpoint and Intune.
- **ServiceNow REST API:** Built a custom connection to ServiceNow to enrich device IDs with Hardware Asset Management (HAM) data, including physical location and ownership history.
- **The "Smoking Gun" Analysis:** By consolidating four data sources into a single structured format, I identified systemic patterns—such as DHCP failures (APIPA addresses) and missing Intune Management Extensions—that would have been invisible during small-batch manual reviews.



### Custom Tooling Developed:
- **Unified Triage Script:** A KQL-driven hunt targeting devices missing 2+ patches, returning IP, OS version, AV health, and sensor states.
- **Network Reachability Module:** A script that parses Defender’s JSON output to ping-test reachable devices while intelligently skipping APIPA (169.254.x.x) addresses.
- **Hybrid-Join Validator:** A specialized checker to verify that Intune management extensions and Group Policies are correctly pushing cloud telemetry on hybrid-joined devices.



### Software Quality: Moving to Pytest
Parallel to the infrastructure work, I deepened my investment in **Software Testing**. Moving beyond "intuition-based" checks, I adopted **Pytest** to ensure my security tools are robust and maintainable.

**Key Learnings:**
- **Parametrization:** Using pytest to run multiple test cases through the same logic to catch edge cases in log parsing.
- **Fixtures & Mocking:** Learning to simulate different environment states and API responses without hitting live production endpoints.
- **Scalability:** Understanding that formal testing isn't just a "nice-to-have"—it's the only way to ensure that as my tools (like WFTAF) grow, they don't break under new conditions.

### Outcome
The automation transformed a week-long manual task into a near-instant diagnostic report. This experience solidified my direction: **Security is a data problem.** By building tools that consolidate data and validating them with rigorous testing, I can solve enterprise-scale vulnerabilities that manual teams simply cannot reach.
