# WTAF project continuation
## Week 10 summary
Had 4 interviews and 9-5 last week + ilness, only managed to purify my script so the output is JSON PowerShell objects only
Hitting the groud running this week however.
I've developed my script so it has scalable versioning schemas: following a simple Major minor patch system (1.0.0) where parser 1 only accepts JSON data with starting with 
1._ and rejects 2._
This ensures any drastic changes to field names, order or bringing in new fields prevents the data being ran with the old parser, or a new parser running old data, vice versa etc.

I've also been implementing hashing to ensure my JSON datas integrity remains constant.

## Challenges faced
What is good hashing practice, 
- Going off intuition and past memory I realised I couldnt create a seperate .hash file as this is easier to tamper with and means downloading multiple files, over engineering and bad practice.
- I also deduced it wouldn't be appropriate to hash a file (including metadata) then append to this file and add an integrity metadata section, since you'd need to modify the entire file which would in turn change its hash so again poor practice.
- I wondered how to do this then, and some research into industry best practice revealed it's easier than I thought to just hash a specific section of the report, the payload and to leave all metadata out, Since we quite frankly dont care if they tamper with metadata as long as a tampered payload is spotted were winning.
