local std = require "std"
local set = std.set
local io = std.io
local func = std.functional
local str = std.string

local lines = io.readlines "./input.txt"
local characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

-- helper
local function strToSet(sack)
  local t = std.Set {}
  for i = 1, #sack do
    set.insert(t, string.sub(sack, i, i))
  end
  return t
end

local function setToChar(sack)
  for char in pairs(func.collect(set.elems, sack)) do
    return string.find(characters, char)
  end
end

-- part 1
local function getPrioOfDupe(sack)
  local splitpoint = #str.rtrim(sack) // 2
  local left       = string.sub(sack, 1, splitpoint)
  local right      = string.sub(sack, splitpoint + 1, -1)
  local dupe_set   = set.intersection(strToSet(left), strToSet(right))

  return setToChar(dupe_set)
end

-- part 2
local function getPrioOfBadge(sack1, sack2, sack3)
  local badge_set = set.intersection(
    strToSet(sack1),
    set.intersection(strToSet(sack2), strToSet(sack3)))

  return setToChar(badge_set)
end

local count_1 = 0
local count_2 = 0

for _, line in pairs(lines) do
  count_1 = count_1 + getPrioOfDupe(line)
end

for i = 1, #lines // 3 do
  local idx_offset = i * 3
  count_2 = count_2 + getPrioOfBadge(
    lines[idx_offset],
    lines[idx_offset - 1],
    lines[idx_offset - 2])
end

print("Part 1", count_1)
print("Part 2", count_2)
