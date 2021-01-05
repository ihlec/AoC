import tables

echo "Customs Questions"

var total_part1 = 0
var total_part2 = 0

var members = 0
var votes: string

proc check_group() =
    members -= 1 # empty line is not an member
    let letterFreq = toCountTable(votes)
    total_part1 += letterFreq.len()

    for answer in letterFreq.values():
        if answer >= members:
            total_part2 += 1  
    votes = ""
    members = 0   

for line in "input".lines(): 
    members += 1
    votes.add(line)
    
    if line == "":
        check_group()
check_group() # catch EOF

echo "Part1: ", total_part1
echo "Part2: ", total_part2