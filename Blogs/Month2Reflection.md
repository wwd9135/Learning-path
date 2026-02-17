# Monthly Reflection: Moving from Scripting to Systems Engineering

Looking back at this past month on placement, there is a clear shift in how I’m approaching technical problems. I started the month focused on solving immediate, isolated tasks at the Met Office; I’m ending it by building architectural foundations for my own security frameworks.

### The Shift: From "Tool User" to "Tool Builder"
The middle of the month was dominated by the **Windows Event Log Parser** and the **120-device patching triage**. Initially, my approach to these was reactive. I was writing scripts to "fix the now." 

However, the critical turning point was realizing that enterprise security is fundamentally a data normalization problem. Whether I was querying the **Graph API** for Intune states or parsing **XML logs**, the bottleneck was never the "hacking" or the "fixing"—it was the time wasted cleaning messy, inconsistent data. 

**Critical Self-Reflection:** Earlier scripts I wrote were functional but "brittle." If an XML tag was missing or an API returned an unexpected null, the script died. This month, I’ve forced myself to embrace **Pytest** and **Data Classes**. It’s slowed down my initial coding speed, but it’s stopped the cycle of "hot-fixing" my own tools. I’ve learned that if a tool isn't robust enough to handle malformed data, it has no place in a production SOC environment.

### Bridging the Silos
The work with **ServiceNow, Defender, and Intune** taught me that "Security" doesn't exist in a vacuum. By building a custom REST API connector to bridge these sources, I realized that the most valuable "smoking guns" are found in the gaps between platforms. Finding a device that shows as "Healthy" in Intune but has an APIPA address in Defender is a perfect example of why cross-source automation beats manual checking every time.



### Project Pivot: The Forensics Triage Focus
Everything I’ve done this month—the JSON normalization logic, the OOP refactoring in Python, and the live system acquisition via PowerShell—is now being funneled into one primary focus: **WFTAF (Windows Forensic Triage & Analysis Framework).**

While my previous projects were "utilities," WFTAF is an **engineered system**. 
- **The PowerShell side** is my acquisition engine.
- **The Python side** is my logic and analysis engine.
- **The JSON pipeline** is the glue that makes it scalable.

I’m moving away from building general-purpose scripts to specialize in **Forensic Triage**. The goal is to take the "data-first" mindset I applied to patching and apply it to Incident Response. 



### Next Month’s Objective
My focus is now strictly on the **WFTAF pipeline**. I’ve proved I can acquire and normalize data; now I need to prove I can detect sophisticated anomalies. I’ll be diving deeper into heuristic analysis—specifically looking at WMI event consumers and process masquerading—to ensure the tool doesn't just collect data, but actually explains it. 

The goal isn't just to graduate with a degree, but to graduate with a codebase that solves actual problems in a CDOC.
