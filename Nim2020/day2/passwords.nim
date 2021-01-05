import re, strutils

echo "Passwords"

var filename = "input"


var valid1, valid2 = 0
for line in filename.lines:
    var matches: array[4, string]

    if match(line, re"(\d+)\-(\d+).(\w)..(\w*)", matches):
        let lower = parseInt(matches[0])
        let upper = parseInt(matches[1])
        let letter = matches[2]
        let pw = matches[3]

        var count = 0
        for l in pw:
            if l == letter[0]:
                count = count + 1
        
        if count >= lower and count <= upper:
            valid1 = valid1 + 1

        if pw[lower-1] == letter[0] or pw[upper-1] == letter[0]:
            if pw[upper-1] != pw[lower-1]:
                valid2 = valid2 + 1

echo valid1
echo valid2



