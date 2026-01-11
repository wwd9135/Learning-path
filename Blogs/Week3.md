# Python CLI Tool 2.0 — Architecture, OOP, Logging & Systems Thinking

This project is an improved and more intentional redesign of my original Python CLI tool. The goal was not to add complexity for its own sake, but to practice **clean structure, separation of concerns, and maintainable design patterns** that scale beyond single-file scripts.

---

## 1. What I Built

### Python CLI Tool (Refactored Version)

I redesigned my original CLI file analysis tool with a focus on **project structure and software design**, rather than raw functionality.

Key improvements:
- Clear directory structure (`src/`, `output/`, `README.md`)
- Modular codebase using classes
- Separation of CLI handling from core logic
- Introduction of structured logging

The tool still performs simple file parsing and filtering, but the architectural decisions were the real learning objective.

---

## 2. Project Structure & Design Choices

### Why I Introduced Classes
Classes allowed me to move away from:
- Monolithic scripts
- Excessive global state
- Unclear data flow between functions

Instead, I designed small, focused classes responsible for a **single, well-defined purpose**. Each method performs one action that contributes toward the class’s overall responsibility (e.g. file handling or analysis).

This made it possible to:
- Reuse tested logic across scripts
- Improve readability
- Reduce side effects
- Debug issues in isolation

---

### Why I Separated CLI from Logic
While the original logic worked correctly, mixing CLI handling and processing logic made the entry point (`__main__.py`) cluttered and harder to reason about.

Separating them achieved:
- Cleaner program entry point
- Easier debugging
- Better testability
- Fewer unintended bugs

The CLI layer now only:
- Validates input
- Parses arguments
- Passes clean data to the logic layer

---

### Why Logging Beats `print()`
Although logging added little functional value for this specific tool, it was a deliberate learning choice.

Logging allows:
- Persistent records of execution
- Error capture in unattended or automated runs
- Different severity levels (INFO, WARNING, ERROR)

Unlike `print()`, logs don’t require a user watching the terminal. This pattern will be essential in future security scripts, scheduled jobs, and monitoring tools.

---

## 3. What Confused Me (and Now Makes Sense)

### Where Data Actually Lives During Execution
Initially, I misunderstood how memory works while a program is running. I assumed RAM itself acted as a cache and didn’t fully grasp when data is written to disk versus memory.

I now understand the hierarchy clearly:

- **Hard drive / SSD** → Long-term persistent storage
- **RAM** → Fast, temporary working memory (cleared on power-off)
- **CPU cache** → Extremely fast, very small memory inside the CPU

The CPU cache stores only the most performance-critical data and operates on cache lines using fast lookup tables. It exists purely to minimise slow memory access to RAM.

This clarified a lot of performance behaviour I previously accepted without understanding.

---

### HTTP Caching
The full flow from:
URL → DNS → web server → response → caching  
was initially overwhelming.

After revisiting it alongside networking fundamentals, I now understand:
- Where browser and OS caching occurs
- How HTTP caching reduces repeated network calls
- Why CDNs sit between clients and origin servers

---

## 4. Networking Consolidation

### Q1 — How NAT Works and Why Subnetting Matters

#### Network Address Translation (NAT)
- Internal networks use private IPv4 ranges
- These addresses are not routable on the public internet
- Routers rewrite source IPs (and often ports) to a public IP
- Translation tables track return traffic

Benefits:
- Multiple devices share one public IP
- IPv4 address conservation
- Basic isolation of internal hosts

#### IPv6 and NAT
IPv6 removes the need for NAT entirely:
- Vast address space (128-bit)
- Devices receive globally unique addresses
- Security relies on firewalls, not address rewriting

---

### Why Subnetting Is Critical
Subnetting enables:
- Efficient address allocation
- Reduced broadcast traffic
- Logical security boundaries
- Clear routing hierarchy

---

### Q2 — What Goes Wrong Without Proper Subnetting

Common failures include:
- Devices unable to communicate due to ARP issues
- Broadcast traffic leaking or overwhelming networks
- Routing loops or black holes
- Overlapping subnets causing IP conflicts
- Default gateways unreachable due to mask mismatches

---

## 5. Computer Science Fundamentals — Memory & Performance

### How Memory Is Organised
RAM is byte-addressable:
- Each byte has its own address
- Larger data types occupy consecutive memory locations

Strings differ from fixed-size types:
- Stored as character arrays
- Terminated with a null byte (`\0`) to mark the end

---

### CPU Cache Fundamentals
The CPU cache stores frequently used data copied from RAM.

Key concepts:
- **Cache hits** → data found in cache
- **Cache misses** → data fetched from RAM

The cache uses:
- **Temporal locality** (recent data reused soon)
- **Spatial locality** (nearby data likely accessed)

---

### Cache Levels
Modern CPUs typically include:
- **L1 cache** — smallest, fastest
- **L2 cache** — larger, slightly slower
- **L3 cache** — shared, largest, still far faster than RAM

---

### Instruction vs Data Cache
Caches are often split:
- Instruction cache → CPU instructions
- Data cache → values and memory addresses

This separation allows parallel fetching and improves execution speed.

---

## Final Reflection
This project wasn’t about adding features — it was about **thinking like a systems engineer**.

By restructuring a simple tool, I learned:
- Why clean architecture matters early
- How memory hierarchy affects performance
- How networking concepts connect to real software behaviour

These foundations will matter far more than any single script as projects grow in size and complexity.
