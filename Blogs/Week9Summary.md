# Project writeup
## Week9

This week I've begun focusing a new project: WFTAF (Windows Forensic Triage & Analysis Framework): A modular DFIR tool using a PowerShell/Python pipeline to automate live system acquisition and heuristic analysis. This data will be given to an LLM for even stronger analysis.
I begun by researching effective windows forensics procedures using PowerShell with admin privledges to extract vast amounts of data.

## Key challenges:
Data normalisation is the main focus of this week, I've decided to build my PS script so it extracts data straight into JSON, which will allow python to parse the data in a much quicker fashion, as python will be able to intercept it as dict's essentially, 
allowing hash mapping instead of linear searching for elements.
I struggled inititally with getting the format right but I found it's easier to just create each category of data (eg. Networks, persistence) into an object then to format the data as JSON and export-JSON to the python parser directly.

This solved the following key issues:
- Parse speed concerns.
- Order issues/ edge case resolving (Associated with text/XML data as opposed to JSON structured)
- This JSON data will
## Outcome
I've successfully created my first PowerShell script and begun parsing the JSON output using python, the key plan here is to scan for 'Smoking guns' and then feed this data into an LLM to find further trends etc.
