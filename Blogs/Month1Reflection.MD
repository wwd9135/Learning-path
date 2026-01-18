# Month 1 – Computer Science Fundamentals Summary

## What I’ve Learned

This month was about understanding what’s *actually* happening underneath the abstractions.

I now understand **ASCII, hexadecimal, and binary**, and how hardware converts data into electrical signals flowing through transistors. At the most basic level, it’s just:

- `0` → transistor closed / off  
- `1` → transistor open / on  

That simplicity is what makes binary so fast and reliable. Everything else we use is built on top of that idea.

---

## Memory & Storage Hierarchy

I’ve learned how memory is structured and why performance depends so heavily on it:

**CPU cache → RAM → Disk (SSD/HDD)**

The key insight here was realising that:
> CPUs spend more time waiting for memory than actually processing instructions.

Caching exists to reduce that waiting time. CPU caches store the most frequently accessed data so the processor doesn’t constantly stall waiting for RAM.

I also now understand that memory is divided into **bytes**, and how programming languages map data types onto those bytes:

- `int` → typically 4 bytes  
- `long int` → typically 8 bytes  
- Arrays → take up exactly as much space as the programmer defines  

This made memory usage feel *real*, not abstract.

---

## What a Program Actually Is

I now understand what happens when a program is built and run.

A program starts as source code written in a language like C, then goes through these stages:

### Compilation Process

1. **Preprocessing**
   - Header files are expanded
   - Macros are resolved
   - Basic checks occur (e.g. declarations exist)

2. **Compilation**
   - Source code is converted into machine code
   - Syntax and semantic checks occur

3. **Linking**
   - All compiled objects are combined
   - Memory is laid out
   - Execution order is finalised

Once executed, a program becomes a **process**, and that process can be split into **threads**.

---

## Process vs Thread Breakdown

### Process-level components
- **Code segment** – executable instructions
- **Data segment** – global and static variables
- **Heap** – dynamically allocated memory

### Thread-level components
- **Stack** – local variables and function calls
- **Registers** – extremely fast CPU-local storage

Understanding this made debugging and performance considerations click properly.

---

## Low-Level Programming Concepts

I’ve learned several core concepts that underpin systems programming:

- **Pointers**  
  Variables that store memory addresses of other variables.

- **Stack memory**  
  Uses a LIFO (Last In, First Out) model.  
  `main()` sits at the bottom, functions are pushed on call and popped on return.  
  This is fast but limited in size and scope.

- **Heap memory**  
  Dynamically allocated memory that exists independently of function scope.  
  Slower than stack access, but flexible and persistent across function calls.

- **Heap data structure** (not memory)  
  A logical structure (min-heap / max-heap) organised as a tree.  
  Completely separate from heap *memory*, despite the confusing name.

- **Buffers**  
  Temporary memory blocks used for input, output, or data in transit.

- **Buffer overflows**  
  When data exceeds a buffer’s allocated size and overwrites adjacent memory.  
  A common vulnerability in low-level languages like C if not handled explicitly.

---

## Learning C (and Why It Matters)

I started learning **C** in the last week of the month, and it’s been critical for cementing these ideas.

Before, many of these concepts were theoretical. C forces you to *experience* them.

Coming from Python, the mental shift was hard at first. C is extremely deliberate:

- You manage memory yourself
- You choose stack vs heap
- You handle bounds and lifetimes manually

This is both C’s **strength and weakness**.

If you rush or make assumptions, you don’t always get errors. You get *silent bugs*, undefined behaviour, or serious security vulnerabilities like buffer overflows or stack corruption.

With great power comes great responsibility (unfortunately true, even if it sounds cringe).

---

## Where I’m Still Improving

I’m becoming more comfortable with C syntax, but after only a few days of practice there are still gaps.

One example is **type casting**, especially when:
- Working with multiple data types
- Returning values across files
- Managing pointers to local vs heap memory  

Local variable pointer errors were a recurring pain point until I properly understood heap allocation.

Fatigue definitely makes this harder, but the learning curve feels productive rather than frustrating now.

---

## Going Forward

My plan is to continue practicing C alongside CS50, but with a stronger hands-on focus:

- Build small programs
- Test them
- Break them deliberately (from a security and engineering perspective)

I also want to start **connecting concepts across disciplines**, for example:
- OS caching → DNS caching
- DNS resolution → web server responses
- HTTP data → client-side rendering
- Where vulnerabilities like XSS, SQL injection, and MITM emerge

This fits how I like to learn:  
**deep technical understanding first, then zooming out to see the full system.**

Overall, Month 1 gave me a solid foundation and the right mental model to build on.
