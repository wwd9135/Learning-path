# Project Writeup: WFTAF Development
## Week 9: Architectural Foundations & Data Normalization

This week marks the start of a new project: **WFTAF (Windows Forensic Triage & Analysis Framework)**. 

WFTAF is designed as a modular DFIR (Digital Forensics and Incident Response) tool that leverages a hybrid PowerShell/Python pipeline. The goal is to automate live system telemetry acquisition and apply heuristic analysis, eventually feeding normalized data into a Large Language Model (LLM) for advanced pattern recognition and anomaly detection.

### Technical Research
I began the week by researching high-privilege Windows forensic procedures. My focus was on identifying which PowerShell cmdlets provide the most "forensic bang for your buck" when extracting volatile data—specifically targeting process trees, network connections, and persistence mechanisms (RunKeys, Scheduled Tasks, and WMI consumers).



### Key Challenges: The Normalization Hurdle
The primary challenge this week was **Data Normalization**. Efficient triage requires moving away from flat-text logs or cumbersome XML formats.

I made the architectural decision to build the PowerShell acquisition engine to stream data directly into **JSON**. This allows the Python analysis engine to intercept telemetry as native dictionaries, enabling:
- **O(1) Hash Mapping:** Replacing slow linear searches with constant-time lookups for specific artifacts.
- **Pipeline Efficiency:** Reducing the overhead associated with regex-heavy parsing of unstructured text.

**The Solution:**
Initially, I struggled with nested formatting issues. I resolved this by refactoring the PowerShell logic to treat each forensic category (e.g., `NetStat`, `Persistence`) as a custom PSCustomObject. By piping these objects into `ConvertTo-Json`, I ensured the Python parser receives a predictable, machine-readable schema every time.

This solved three critical issues:
1. **Execution Latency:** Dramatically improved the speed of the analysis phase.
2. **Schema Integrity:** Eliminated edge cases caused by inconsistent XML tagging or white-space in text logs.
3. **LLM Readiness:** Structured data is significantly easier for LLMs to tokenize and analyze for sophisticated trends.



[Image of the incident response lifecycle showing detection, containment, eradication, and recovery]


### Outcome & Next Steps
I have successfully validated the end-to-end pipeline:
1. **Acquisition:** PowerShell script extracts live system state.
2. **Transfer:** Data is piped as structured JSON.
3. **Parsing:** Python engine successfully ingests the JSON into dictionaries.

**Next Week's Focus:** Developing the "Smoking Gun" heuristic engine—identifying known-bad indicators (C2 IPs, masquerading processes) before passing the refined dataset to the LLM for deep-trend analysis.
