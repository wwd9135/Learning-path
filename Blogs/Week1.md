## Week 1 Progress Log

### 1. What I Built
**Projects:** Log Parser · CLI To-Do Manager · Password Strength Checker

---

### Log Parser
- Built a Python-based log parser that triggers a PowerShell script to collect Windows Event Logs.
- The PowerShell script gathers logs based on:
  - User-provided Event IDs
  - User-defined time ranges
- The Python script then processes the output and applies:
  - Keyword searches  
  - Detection of warnings and errors  
  - Flagging of specific Event IDs  

---

### CLI To-Do List Application
- Created a command-line tool to manage user tasks efficiently.
- Used `while` loops to simulate a continuous (“always-on”) application session that the user can exit manually.
- This mirrors how real GUI applications maintain state and interaction loops.

---

### Feature Restraint & Design Decisions
- I deliberately avoided adding advanced features early to prevent unnecessary complexity.
- Considered implementing file persistence (custom save paths or auto-saving to the script directory), but decided against it due to:
  - Increased error-handling requirements
  - Risk of overengineering at this stage
- Plan to revisit and rebuild this project later with cleaner architecture and better abstractions.

---

### Future Improvements
Potential enhancements identified but intentionally deferred:
- “On hold” task status
- Task comments
- Expanded functionality similar to Jira-style task tracking

These will be revisited once I am more confident with:
- GUI development
- Robust error handling
- Secure file operations

Adding them now would likely introduce unnecessary complexity and security risks.

---

### Project Repository
Projects are available under:  
`Learning-path/Python/Mini-projects`  
Repository: **wwd9135/Learning-path**

---

## 2. What I Learned (Conceptual)

### Python Fundamentals
- Gained a stronger understanding of Python syntax through trial, error, and debugging.
- Learned about character types and input handling.

Example issue encountered:
```python
def taking_input():
    option = input(
        "Select an option:\n"
        "1: Add tasks\n"
        "2: View tasks\n"
        "3: Remove tasks\n"
        "4: Save & exit\n"
    )
