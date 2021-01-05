import strutils, algorithm, tables

echo "Joltage"

var file: seq[int]
for line in "input".lines:
    file.add(line.parseInt)

file.add(0)
file.sort()
file.add(file.high + 3)

# Part 1
var one_diff, three_diff = 0
for adapter_idx, adapter in file:
    if adapter_idx == file.high: 
        break
    # compare current with next adapter
    if file[adapter_idx+1] - adapter  == 1:
        one_diff += 1
    elif file[adapter_idx+1] - adapter == 3:
        three_diff += 1
echo "Part 1: ", one_diff * three_diff

# Part 2
var counts = [(0, 0)].toOrderedTable
for e in 0..file[^1]:
    counts[e] = 0

# seat_socket
counts[0] = 1 

for a in file[1..file.high]:
    # catch non-existent adapters
    if not counts.hasKey(a-1):
        counts[a-1] = 0
    if not counts.hasKey(a-2):
        counts[a-2] = 0
    if not counts.hasKey(a-3):
        counts[a-3] = 0

    # detect options to reach the current adapter
    var
        back1 = counts[a-1] # did we see an adapter before the current adapter 
        back2 = counts[a-2] # [yes\no\multiple]
        back3 = counts[a-3] # [1\0\n]
    counts[a] = back1 + back2 + back3 # options before are added up

# how many options did add up to reach last element?
echo "Part 2: ", counts[file[file.high]]