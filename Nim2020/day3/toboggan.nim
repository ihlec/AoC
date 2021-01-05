import sequtils

echo "Tobogan"

let lines = toSeq("input".lines)

proc slideDown(xpath: int, ypath: int): int =
    var x = 0
    for i in countup(0, lines.high, ypath):
        if x > lines[i].high:
            x -= lines[i].len
        let line = lines[i]
        if line[x] == '#':
            result += 1
        x += xpath

echo slideDown(1,1) * 
    slideDown(3,1) * 
    slideDown(5,1) * 
    slideDown(7,1) * 
    slideDown(1,2)
