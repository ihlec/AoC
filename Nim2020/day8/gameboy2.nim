import strutils

echo "Gameboy Part 2"

var file: seq[string]
for line in "input".lines:
    file.add(line)

proc process_part2(
        patchindex: int, 
        index: var int, 
        instructions_history: var seq[int], 
        accumulator: var int): int =

    let instruction = file[index]
    var operation = instruction[0..2]
    let argument = parseInt(instruction[4..instruction.high])

    # EOF
    if index >= file.high:
        return accumulator

    # break on looped instruction
    if index in instructions_history:
        return 0
    else:
        instructions_history.add(index)

    # patch
    if index == patchindex and operation == "nop":
        operation = "jmp"
    elif index == patchindex and operation == "jmp":
        operation = "nop"
    
    # processor
    case operation:
        of "nop":
            index += 1
        of "jmp":
            index += argument
        of "acc":
            accumulator += argument
            index += 1
    process_part2(patchindex, index, instructions_history, accumulator)

for patchindex in 0..file.high:
    var accumulator = 0
    var instructions_history: seq[int]
    var index = 0

    accumulator = process_part2(patchindex, index, instructions_history, accumulator) 
    if accumulator != 0:
        echo accumulator




