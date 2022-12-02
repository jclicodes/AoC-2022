# Day 2

Summary: First column of input will either be A or B or C in each row. A = 1 point, B = 2 points, C = 3 points
Second column is X, Y, Z. X = 0, Y = 3, Z = 6

For silver, all you have to do is compute a full total of all rows.

For gold, the second column describes the outcome of the game, rather than what move you played. So there is some inference that you must doto calculate the total score again. For this solution, this only required a few values to be tweaked, but I imagine particular strategies would have been written off completely as a result of the fundamental change to the meaning of the data.

## Giga Input 

N/A

## Final remarks on Perl

I have never experienced Perl prior to this; due to its intentionally simplistic design, it was very easy to pick up in 3 minutes of a Fireship video. 

Once I figured out how to read from `stdin`, the problem pretty much solved itself.

I have no plans to use this language again. Other scripting languages like Lua, Python and Zsh serve my purposes just fine. I really did not like the community-driven tooling available for Perl, one of the most popular LSP servers would give generic warnings like 'This might be a typo!' when in-fact, I had just forgotten a semi colon on the previous line. 

Given the simplicity of the language, I rather regret not saving this one for a more difficult puzzle. I figured given its age, it may be harder to use for a complete newbie. Clearly, I was mistaken.

