import strutils

echo "Expenses Part 1"

var filename = "input"
var sample: seq[int]

# Part 1
for line in filename.lines:
    sample.add parseInt(line)

block run:
    for num1 in sample:
        for num2 in sample:
            for num3 in sample:
                if num1 + num2 + num3 == 2020:
                    echo "Part 1: ", num1 * num2 * num3
                    break run

# Part 2
block run:
    for num1 in sample:
        for num2 in sample:
            if num1 + num2 == 2020:
                echo "Part 2: ", num1 * num2
                break run

