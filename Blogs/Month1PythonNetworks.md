# Month 1 – Python & Networking Summary

## Python

This month, I built a **network subnetting CLI tool**, focusing on:

- CLI input parsing  
- Correct project structure  
- Logging  
- Delivering a complete, functional project end-to-end  

The tool accepts:
- Subnet name  
- Required host count per subnet  
- A user-defined buffer for additional hosts  

While this was theoretically a simple project, I have extensive experience manually subnetting during university and building networks. This allowed me to focus on **what data is genuinely valuable** and **what features an engineer would realistically need**, rather than overengineering the solution.

I encountered minor difficulties when working with Python’s IPv4 module, but overall the library is intuitive, well-designed, and clearly documented, making it straightforward to work through those issues.

This project allowed me to further practice **object-oriented programming**, using classes to structure the application cleanly and following good design principles such as:
- Single-responsibility functions  
- Clean, readable code  

By the end of this month, I’ve solidified my **Python fundamentals** and can now competently complete small projects within a few hours, with:
- Good structure  
- Proper logging  
- Basic testing  
- Clean, readable code  
- Clear README documentation  

One challenge this month was adapting to consistently using good project structure and taking Git/GitHub workflows more seriously. This has improved significantly, and I now feel confident in these areas.

### Going Forward (Python)

- Recap core syntax and fundamentals  
- Upskill over the next couple of weeks  
- Begin designing more advanced projects toward the end of Month 2  
- Target projects such as dashboards, advanced log parsers, and networking tools  

My focus will remain on **competency over speed**, writing clean and maintainable code, and taking the time to understand Python properly. Learning **C and low-level computing concepts** alongside this should further improve my Python code quality.

---

## Networking

This week, I focused on understanding key networking protocols in more depth.

### DNS
I now have a clearer understanding of how DNS works, including:
- Recursive resolver behavior  
- Iterative queries when caches are missed  
- Traversal through authoritative name servers until the target domain’s DNS server is reached  

### ARP
I learned how ARP functions at a low level:
- Devices broadcast requests asking for the MAC address associated with an IP  
- Any device on the network can respond, which introduces a security risk  

This allows for ARP spoofing, where a malicious device responds with its own MAC address to intercept traffic. This vulnerability has existed for decades, so mitigations are well-established.

The primary mitigation is **Dynamic ARP Inspection (DAI)**, where:
- Switches cross-reference IP-to-MAC bindings learned via **DHCP snooping**  
- Traffic is blocked if a mismatch is detected  

### DHCP
While already familiar with DHCP, I can now explain it in more depth, including:
- How DHCP lease allocation works  
- Common failure scenarios  

I learned that resilience is typically achieved through:
- Load-balanced or redundant DHCP servers  
- Statically configured critical infrastructure (firewalls, routers, switches)  

This ensures core infrastructure remains operational if DHCP services fail, allowing time for recovery before endpoint leases expire.

### Packet Analysis

I practiced identifying HTTP, DHCP, DNS, ARP, and TCP transactions in **Wireshark**.  
ARP traffic was particularly interesting, as packets literally contain plaintext messages such as:

> “Who has IP ___? Tell IP ___.”

This makes spoofing trivial without protections like DAI, reinforcing its importance.

### Going Forward (Networking)

- Revisit core networking fundamentals  
- Continue learning additional protocols and how they interconnect  
- Resume hands-on networking practice using **Cisco Packet Tracer** and previous university labs  

I want to prioritise **practical application** to avoid losing theoretical knowledge. As with Python and C, applying concepts consistently is key. I may also explore additional networking tools to broaden hands-on experience.
