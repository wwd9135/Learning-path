# Week 5 – Foundations via Log Parser Project

## Primary Focus

This week started with revisiting basic Python syntax, but with a different mindset than before. My recent exposure to C and core computer science theory has made it much easier to reason about what Python is actually doing under the hood. While Python is far less deliberate than C, there’s still value in thinking about memory, efficiency, and structure from a lower-level perspective.

The main goal this week was to strengthen project structure and code quality by starting a new log parser project from scratch. The focus was deliberately not on flashy features, but on how the code is written and organised.

I chose a log parser intentionally. It forced me to deal with type conversion and casting, and pushed me to think more carefully about data structures — when to use lists, sets, or dictionaries, and why. That decision-making will matter later when the theory becomes heavier.

I made a conscious effort to use type hints for all relevant variable declarations and key function inputs. This slowed development slightly, but the improvement in readability and clarity was worth it.

## How the Project Went

The core project took around four hours to complete. Along the way, I learned more about:

- Using type hints intentionally rather than mechanically  
- Structuring a project properly using `__init__.py`  
- Converting a folder into a real Python package with `pyproject.toml`  
- Designing code with OOP in mind, which made the logic easier to reason about overall  

On the technical side, this was my first real exposure to XML parsing. I hadn’t worked with XML formats before, so understanding how the data is structured and accessed was new. I struggled initially, but after finding an example that parsed a different XML format, I was able to adapt that approach to my own use case without too much friction.

Once the structure clicked, everything became far more manageable.

## Reflection

I’m happy with the outcome. The code is clean, readable, and presentable, and I spent my time practicing skills that actually matter rather than surface-level features.

I also made a conscious effort to commit properly to Git throughout the project. I ended up with around six commits. In hindsight, I could have committed more granularly (for example, per function), but given the small scope of the project, I’m comfortable with how I approached it.

## Going Forward

Next steps are clear:

- Continue practicing type hints and intentional OOP  
- Introduce logging and testing in future weeks  
- Revisit this project later to extend it  

Longer term, I’d like this to evolve into a general-purpose toolbox:  
a single utility that supports multiple file types, keyword or event ID filtering, and robust handling of edge cases to ensure accurate and relevant output.

For now, this week did exactly what it was meant to do — reinforce foundations and set the tone for the rest of the journey.

## Networking

This week I shifted more toward hands-on application, making sure I immediately apply anything new I learn so it sticks. I refreshed my understanding of:

- Switching  
- VLANs  
- STP  
- Basic routing  
- DNS  
- DHCP  

I’m pleased with how much more deliberately I can now design networks. Instead of just configuring things until they work, I’m focusing on understanding *why* each feature is used, and I’m already thinking about redundancy, efficiency, and security as part of the design process.

Most of my work has been done in Packet Tracer, which is fine for now and lets me move at my own pace. That said, I don’t want to rely on it alone. I’m considering building a small home lab using an old server, switch, and possibly a router to tie networking more closely into security. If that’s not feasible in the short term, I’ll likely move toward more advanced software tooling — my university will be using GNS3 next year, so that’s a natural next step.

## Routing Practice

I also spent a full day practicing routing concepts, including:

- ICMP traffic flow  
- Static vs dynamic routing  
- Routing on a stick for inter-VLAN routing  

This was a standout moment for me. I was able to follow ICMP packets through the network and reason about why certain segments couldn’t communicate. I identified that the issue was a lack of static routes between two LANs. In the past, I would have relied on trial and error; this time, I was able to reason through the problem directly and fix it with intent.

I also accidentally went deeper into VLAN-based network segmentation. Because my DHCP server wasn’t placed on a VLAN, endpoints began pulling random public IP addresses instead of addresses from my DHCP pool. While I didn’t fully fix this yet, I understand the solution: configuring the router to forward DHCP requests from each VLAN to the DHCP server (e.g. using DHCP relay / helper addresses), and properly segmenting traffic using router-on-a-stick.

## CS Theory & C Learning

This week I focused on arrays and linked lists in C.

I attempted to build my own linked list. While I didn’t fully complete it (it’s slightly beyond my current skill level), the exercise helped solidify the concepts.

- A **singly linked list** consists of non-contiguous memory blocks, where each node contains data and a pointer to the next node. The final node points to `NULL`.  
- A **doubly linked list** extends this by adding a pointer to the previous node as well. Naturally, the first node’s previous pointer is `NULL`.  

Compared to arrays, linked lists are far more flexible when it comes to insertion and deletion. Arrays, however, are indexable and allow faster access to elements, while linked lists rely on linear traversal.

Understanding these trade-offs is helping me connect data structures to real-world performance and design decisions, rather than seeing them as abstract theory.
