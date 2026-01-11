# Learning Log: CLI Development, Python Internals, Networking & CS Fundamentals

This repository documents a focused period of learning where I deliberately worked at the fundamentals level. The goal was not to build production-ready tools, but to understand *why* systems behave the way they do — from Python internals, to networking flow, to low-level computing concepts in C.

---

## 1. Projects Built

### CLI File Analysis Tool
I built a command-line tool that accepts file paths and analyses file contents using:
- Regular expressions
- Line counting
- Duplicate detection and removal

This project was mainly about strengthening core Python skills:
- Argument parsing using `argparse`
- Input validation via dedicated functions
- Regex usage for structured text analysis

**Key mistake identified:**  
I used `raise` with a string instead of raising a proper exception type. While this worked in isolation, it would be unsafe in a larger program and could cause unhandled crashes. The takeaway was clear: always raise explicit exception types with meaningful messages.

---

### Password Input CLI Tool
This tool focused on input handling and filtering rather than completeness or security hardening.

Primary learning outcomes:
- Deeper understanding of `argparse`
- Type conversion and validation
- Writing clearer, more defensive functions

I intentionally avoided making this production-ready, as the educational value was in understanding the mechanics rather than over-engineering a small utility.

---

## 2. Conceptual Learning

### Argument Parsing (`argparse`)
`argparse` stood out as one of Python’s best standard libraries. It provides granular control while remaining readable and intuitive — similar in spirit to PowerShell’s parameter system.

A particularly useful feature is verbosity control:
- `0` → minimal, user-friendly errors (e.g. *file not found*)
- `2` → full Python tracebacks for debugging

This balance between usability and diagnostics is extremely valuable in real tools.

---

### Virtual Environments
Virtual environments allow multiple Python package configurations on the same system.

Their primary benefits:
- Dependency isolation
- Version control
- Avoiding system-wide conflicts

While not essential for every small project, their value becomes obvious as project complexity grows.

---

### Python Scope and State Management
I revisited Python’s scope rules and reinforced why excessive global state is bad practice.

Scope recap:
- **Built-in**: Predefined functions and objects (e.g. `print`)
- **Global**: Variables defined outside functions
- **Local**: Variables defined inside functions
- **Non-local**: Variables from a parent function used inside nested functions

Using globals across many functions quickly becomes unmanageable. Passing data explicitly via parameters is safer, clearer, and easier to reason about.

---

## 3. Key Confusions Resolved

### Mutable vs Immutable Types
I encountered behaviour where lists changed inside functions, but integers did not — initially confusing until mutability clicked.

- **Mutable types** (lists, dicts, sets) are modified in place
- **Immutable types** (ints, strings, tuples) cannot be changed; Python creates new objects instead

Understanding this clarified several behaviours I had previously worked around without fully grasping.

---

### Design Mistakes Noted
- Overuse of global variables
- Poor use of recursion where loops were more appropriate

These mistakes didn’t break small scripts but would scale poorly. Catching them early was valuable.

---

## 4. Networking Fundamentals

The aim here was to build a clear mental model of how user actions become network traffic.

Topics revised:
- OSI and TCP/IP models
- Encapsulation
- What actually happens when a user enters a URL

This tied together user input, binary representation, packetisation, and physical transmission in a way that finally felt intuitive.

---

### OSI Model Summary

**Layer 7 – Application**  
The browser parses the URL, checks browser and OS DNS caches, performs DNS resolution if needed, then establishes a TCP (or TLS over TCP) connection. Content may be served via a CDN rather than the origin server.

**Layer 6 – Presentation**  
Data formatting, encoding, encryption, and decryption.

**Layer 5 – Session**  
Session control concepts (largely abstracted into the application layer in TCP/IP).

**Layer 4 – Transport**  
Protocol selection (TCP vs UDP), port usage, flow control, reliability.

**Layer 3 – Network**  
IP addressing and routing decisions (e.g. OSPF determining optimal paths).

**Layer 2 – Data Link**  
Framing, MAC addressing, error detection.

**Layer 1 – Physical**  
Transmission of bits as electrical or wireless signals.

---

## 5. Wireshark Observations

### How a Web Request Actually Works
1. User enters a URL
2. Browser parses protocol, domain, and path
3. DNS cache checked; OS resolves DNS if required
4. TCP three-way handshake (`SYN → SYN/ACK → ACK`)
5. HTTP requests and responses exchanged
6. Connection closed using `FIN` / `ACK`

---

### What a Port Really Is
A port is:
- A 16-bit number in a TCP or UDP header
- Used by the OS to route traffic to the correct application

Ports are **not**:
- Physical interfaces
- Hardware
- Packet inspectors

Example:
- TCP 443 → HTTPS
- UDP 443 → QUIC

---

## 6. Computer Science Fundamentals (C)

### Core Principles
- **Correctness**: Code must do exactly what it’s supposed to
- **Design**: Clean abstractions and structure
- **Style**: Readability, naming, spacing, and clarity

---

### C vs Python
C is strict and unforgiving:
- Data types must be declared
- Function signatures must match
- Format specifiers must be correct (`%d`, `%s`, etc.)

A standard `int` is usually 32 bits, which introduces real overflow risks.

A real-world example:
Aircraft systems once used 32-bit counters for timekeeping, causing overflows after long runtimes and forcing system resets mid-flight.

---

### Floating-Point Precision
Floating-point numbers are approximate:
- Extreme precision reveals inaccuracies
- Integer division truncates unless explicitly cast

Lesson learned: always understand the limits of the data types you use.

---

### Compilation Stages
1. **Preprocessing** – macros and syntax handling
2. **Compilation** – source code to assembly
3. **Assembly** – assembly to machine code
4. **Linking** – combining libraries and dependencies into a final executable

This clarified how libraries like `stdio.h` are incorporated into compiled binaries.

---

## Final Reflection
There were no dramatic breakthroughs — just steady consolidation.

The biggest gain was a clearer internal model of how:
- Code becomes instructions
- Instructions become packets
- Packets become signals on physical media

Learning fundamentals at depth has already paid off, especially as concepts repeat across different technologies.
