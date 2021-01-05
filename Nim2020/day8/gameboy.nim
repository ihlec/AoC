import strutils

echo "Gameboy Part 1"

var file: seq[string]
for line in "input".lines:
    file.add(line)

var accumulator = 0
var instructions_history: seq[int]
var index = 0

proc process_part1() =
    let instruction = file[index]
    let operation = instruction[0..2]
    let argument = parseInt(instruction[4..<instruction.len])

    if index in instructions_history:
        return
    else:
        instructions_history.add(index)
    
    # processor
    case operation:
        of "nop":
            index += 1
        of "jmp":
            index += argument
        of "acc":
            accumulator += argument
            index += 1
    process_part1()

process_part1()
echo accumulator



