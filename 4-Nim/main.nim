import std/[strutils, strscans]

let input = readFile("input.txt")

var part1 = 0
var part2 = 0
var a1, a2, b1, b2: int

for line in input.splitLines():
  discard scanf(line, "$i-$i,$i-$i", a1, a2, b1, b2)
  let overlap = min(a2, b2) - max(a1, b1)
  part1 += (a2 - a1 == overlap or b2 - b1 == overlap).int
  part2 += (overlap >= 0).int

echo "Part 1: ", part1 - 1
echo "Part 2: ", part2 - 1

