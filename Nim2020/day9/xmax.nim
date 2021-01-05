import strutils, algorithm, sequtils

echo "Xmax"

var file: seq[int]
for line in "input".lines:
    file.add(line.parseInt)

let backtrace = 25

proc checker(window: seq[int] ,currentnumber: int): bool =
    for number in window:
        for number2 in window:
            if (number + number2) == file[currentnumber]:
                return true
    return false

proc find_fault(): int =
    for currentnumber in backtrace..file.high:
        let window = file[(currentnumber - backtrace)..<file.len]
        if not checker(window, currentnumber):
            return currentnumber

proc find_continguous_sum(target: int): (int, int) =
    # returns Start and End of sequence
    var current_sum, start, i = 0

    while true:
        current_sum += file[i]
        i += 1

        if currentsum == target:
            return (start, i)
        elif currentsum > target:
            currentsum = 0
            start += 1
            i = start

# Part 1
var fault = file[find_fault()]
echo "fail on ", fault

# Part 2
var bounds = find_continguous_sum(fault)
var resultset = file[bounds[0]..bounds[1]]
resultset.sort()
echo resultset[0] + resultset[resultset.high]