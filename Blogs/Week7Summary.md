# Week 7 – Testing

This week I explored software testing in depth, and it became clear just how essential it is for building reliable, maintainable code. Pytest in particular stood out as a powerful framework far beyond the basic, intuition‑driven testing I’ve relied on so far. It enables thorough validation of a module’s behaviour, supports testing deep edge cases, and makes it easy to simulate a wide range of inputs, environments, and application states.

At first, I struggled to understand why formal testing was necessary, since my previous projects worked fine with simple manual checks. But learning pytest showed me how much more robust and scalable proper testing can be. Features like parametrised tests, fixtures, and environment simulation make it possible to test complex scenarios and ensure code behaves correctly under all conditions.

Going forward, I plan to integrate structured tests into all of my production‑level or deployed projects, and include at least some basic automated tests in my personal work. This will help me build more reliable software and catch issues early in development.

---

I developed several PowerShell scripts this week, with the most significant work focused on analysing 120 devices that weren’t receiving patches. The original plan was for five of us to check them manually, but I chose to automate the entire process by pulling data from Intune and Defender using the Graph API and advanced hunting KQL queries. This was challenging at first—learning KQL syntax, working with the Graph PowerShell module, and getting comfortable querying the Graph REST API—but it allowed me to compile all the information into a clean, readable format.

I also integrated data from ServiceNow, which stores our Hardware Asset Management records such as device ownership history and physical location. This required building my own REST API connection to ServiceNow. Automating this step made a huge difference: instead of manually checking four separate data sources for each device, the script consolidated everything instantly. This dramatically sped up the troubleshooting process and prevented the team from missing patterns that only become obvious when analysing all 120 devices together rather than small batches.

The main KQL hunt I built gathered devices missing two or more patches and pulled details such as IP address, assigned user, OS version, AV version, and sensor states. From there, I created additional scripts to act on or enrich this data:

- **Ping‑check script:** Loops through Defender’s JSON output, pings each IP, and generates a structured report showing which devices are reachable. It also identifies APIPA addresses (169.254.x.x), which indicate DHCP failure or device inactivity, and skips pinging them.
- **Intune compliance checker:** Takes Defender’s device list and verifies managed state, assigned user, last check‑in, and login data. This helps confirm that Defender’s telemetry matches Intune’s records. For hybrid‑joined devices, it also checks that the Intune management extension and required group policies are present, since these are responsible for cloud telemetry submission.

I really enjoyed working on the automation and data‑flow side of this project, and I’m planning to build a Power BI dashboard to visualise the results. It would give us faster, clearer oversight of the estate and highlight the patterns and “smoking guns” I found—many of which would have been missed if the team had manually reviewed only 20 devices each instead of analysing the full dataset.
