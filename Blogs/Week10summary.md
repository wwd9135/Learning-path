# WTAF project continuation
## Week 10 summary
Had 4 interviews and 9-5 last week + ilness, only managed to purify my script so the output is JSON PowerShell objects only
Hitting the groud running this week however.
I've developed my script so it has scalable versioning schemas: following a simple Major minor patch system (1.0.0) where parser 1 only accepts JSON data with starting with 
1._ and rejects 2._
This ensures any drastic changes to field names, order or bringing in new fields prevents the data being ran with the old parser, or a new parser running old data, vice versa etc.

I've also been implementing hashing to ensure my JSON datas integrity remains constant.
