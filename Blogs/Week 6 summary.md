# Python writeup
## Week 6 – Data Classes

This week, I learned about **data classes**, **environment variables**, and **object-oriented programming** more broadly. Data classes stood out as a particularly useful tool for making code more deliberate, structured, and well-segmented.

They are especially effective when you need:

- Clean, structured data containers  
- Automatic comparison or ordering  
- Sensible defaults and clear type hints  
- Optional immutability (`frozen=True`)  
- Less boilerplate and improved readability  

I found the core concepts relatively easy to understand. However, applying data classes to an existing project proved far more difficult than expected. The main issue I ran into was **type casting**, particularly around characters and data structures. My CLI logic had been built entirely around looping through lists in a very specific format. The only way I could initially get the data class working was by returning a data class object that itself contained lists.

I didn’t realise this design choice would become a problem until I had already fully implemented it. When I later tried to unpack those lists and loop through them in the CLI, the structure I received looked like:
[DataClass{}(10)(""){DataClass{}()}]

instead of the expected:

[[dict, str, int], [dict, str, int]]

In hindsight, this was poor forward planning on my part. That said, it’s also a natural mistake when working with completely new syntax — I had no reason to assume that data class objects wouldn’t be directly iterable or that they would introduce additional structure and parentheses into the output.

To summarise, I intend to revisit data classes, but this time by starting a **new project from scratch** and making them part of the **core design** rather than trying to retrofit them. This will allow me to design the CLI module around its own dedicated data class, responsible for parsing input data, enforcing structure, and raising errors where appropriate. The CLI can then operate on clean, finalised data.

This experience was a solid learning point, and I’ll be carrying those lessons forward.

## Network Lab Write-up

I built a two-LAN network using **inter-VLAN routing via a router-on-a-stick configuration**, deliberately avoiding Layer 3 switches and SVIs to force a deeper understanding of what was actually happening on the wire. VLAN segmentation was used to model four separate offices, each assigned its own VLAN. On top of this, I implemented **DHCP**, **DNS**, and **static routing** between the two LANs.

For the second LAN, the focus was on **efficiency and stability**, particularly the use of **STP** to prevent switching loops. The goal wasn’t just to make the network work once, but to make it work properly and reliably.

This lab was challenging and resisted progress at multiple points. Several failures initially made little sense, but what ultimately carried me through was **patience and methodical troubleshooting**. I relied heavily on **ICMP (ping)** and **ARP** to trace where traffic was flowing and, more importantly, where it was being dropped. That process significantly improved how I approach network troubleshooting.

A key challenge was **DHCP configuration**. I was configuring over **100 endpoints**, with a dedicated DHCP pool per VLAN. This forced me to properly understand VLAN boundaries and broadcast behaviour. VLANs are not always intuitive — my initial instinct was to assume DHCP traffic would naturally reach the server, either via the native VLAN or without any additional configuration. That assumption was incorrect.

The solution was to configure an **`ip helper-address`** on each router sub-interface so DHCP requests from each VLAN were correctly forwarded to the DHCP server instead of being dropped. This resolved the initial issue.

However, a second problem surfaced: DHCP offers were leaving the server but never reaching the clients. After rebuilding the topology and rechecking configurations, I identified the root cause as **incorrect trunking**. The network consisted of three core switches and eight access switches, but some links between them were configured as **access ports** instead of trunks. As a result, VLAN traffic was silently blocked. The endpoints were not misconfigured — the network design was. Once the links were correctly set as trunks, full connectivity was restored.

By the end of the lab, several concepts were fully solidified:

- How VLANs truly isolate and control traffic  
- Why STP is essential even in seemingly simple topologies  
- How DHCP and ARP function at a practical level  
- How ICMP fits into real-world troubleshooting beyond basic reachability checks  

This lab went beyond learning commands. It forced a genuine understanding of how LANs operate and why specific configurations are required. I can now design and configure LANs with confidence, backed by understanding rather than assumption.

Frankly, I can configure LANs like they’re going out of fashion.
