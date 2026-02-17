# Project Writeup: Windows Event Log Parser
## Week 8: Robustness, OOP, and Graceful Recovery

This week, I focused on transforming a basic script into a production-ready **Windows Event Log Parser**. The goal was to build a tool that isn't just "functional" but highly reliable when faced with the messy, inconsistent data found in real-world enterprise environments.

### Technical Deep Dive: Reliability Engineering
I implemented several layers of robustness to ensure the parser handles enterprise-scale telemetry without crashing:
- **Input Validation:** Added strict file-type checks and encoding handlers to manage hidden Byte Order Marks (BOM) often found in Windows XML exports.
- **Advanced Filtering:** Integrated `argparse` to allow for granular CLI parameters, including specific Event ID isolation, keyword matching, and ISO 8601 timestamp filtering.
- **Structured Logging:** Moved away from print statements to a formal logging schema, allowing for better debugging and audit trails of the parsing process.



### Key Challenges: The "Messy Data" Problem
The most significant hurdle was **Data Normalization** within broken or malformed XML structures.

**The Challenge:**
Standard XML parsers often fail when elements like `<Event>` are misaligned or missing due to export errors. Additionally, handling Windows timestamps and converting them into a searchable format via the CLI required a deep dive into Python's `datetime` and `argparse` modules.

**The Solution:**
- **OOP & Data Classes:** I refactored the core logic using Python **Data Classes**. This kept the code clean and allowed me to treat each log entry as a structured object, making the data much easier to manipulate and filter.
- **Error Recovery Layer:** I designed a "graceful recovery" mechanism that identifies malformed XML blocks and attempts to correct them or skip them without breaking the entire execution pipeline.


### Outcome
I’ve produced a tool that I can now use practically in my role at the Met Office. I can download full event logs from any device in the estate and run them through this parser to bypass the frustration of manual XML review. 

**The Result:** A reliable, high-speed utility that turns raw, messy XML into actionable security intelligence.
