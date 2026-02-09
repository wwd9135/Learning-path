# Week 8 – Logging & Testing
This week I built a Windows Event Log parser with a strong focus on robustness. I added checks to ensure the input file type was valid, corrected malformed data, and introduced parameters for timestamp filtering, specific event IDs, and keyword matching. These additions made the parser far more usable and complete.
I enjoyed producing a project that was simple on the surface but highly reliable underneath.

I incorporated structured logging and four rounds of testing to cover edge cases, and I deepened my understanding of OOP—especially how to use data classes effectively to keep the code clean and maintainable.
The most challenging part was handling timestamps. 

Getting the formatting right required learning more about CLI arguments and the argparse module. Data normalisation was another difficult area: dealing with broken or inconsistent XML logs meant figuring out how to parse data even when elements like <event> were missing or misaligned. Understanding these common issues helped me design the parser to recover gracefully from bad input.
I’m pleased with the final result. I can now download full event logs from any device at work and run them through my parser automatically, saving time and avoiding the frustration of manually digging through messy XML.
