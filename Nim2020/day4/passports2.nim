import re, strutils

echo "Passports Part 2"

proc hightcheck(p: tuple): bool =
    let v = p.hgt
    result = false
    if v[^2..^1] == "cm":
        if parseInt(v[0..^3]) in 150..193:
            result = true
    elif v[^2..^1] == "in":
        if parseInt(v[0..^3]) in 59..76:
            result = true

proc is_valid(p: tuple): int =
    result = 0
    for value in p.fields():
        if value == "invalid":
            return 0
    
    if parseInt(p.byr) in 1920..2002:
        if parseInt(p.iyr) in 2010..2020:
            if parseInt(p.eyr) in 2020..2030:
                if hightcheck(p):
                    if (p.hcl.startsWith('#') and p.hcl.len == 7):
                        if p.ecl in ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"]:
                            if p.pid.len() == 9:
                                result = 1

proc checker(): int =
    let passport = ( # tuple (because tables/dicts need a module)
        byr: "invalid",  # birth year
        iyr: "invalid",  # issue year
        eyr: "invalid",  # expiration year
        hgt: "invalid",  # height
        hcl: "invalid",  # hair color
        ecl: "invalid",  # eye color
        # cid: "invalid",  # country id
        pid: "invalid",  # passport id
        )

    # (\S+) - any value but no white space
    let byr = re".*byr:(\S+).*"
    let iyr = re".*iyr:(\S+).*"
    let eyr = re".*eyr:(\S+).*"
    let hgt = re".*hgt:(\S+).*"
    let hcl = re".*hcl:(\S+).*"
    let ecl = re".*ecl:(\S+).*"
    let pid = re".*pid:(\S+).*"

    result = 0
    var current_passport = passport
    for line in "input".lines:
        var matches: array[1, string]
        if match(line, byr, matches):
            current_passport.byr = matches[0]
        if match(line, iyr, matches):
            current_passport.iyr = matches[0]
        if match(line, eyr, matches):
            current_passport.eyr = matches[0]
        if match(line, hgt, matches):
            current_passport.hgt = matches[0]
        if match(line, hcl, matches):
            current_passport.hcl = matches[0]
        if match(line, ecl, matches):
            current_passport.ecl = matches[0] 
        if match(line, pid, matches):
            current_passport.pid = matches[0]

        if line.string == "":
            result += is_valid(current_passport)
            current_passport = passport
    result += is_valid(current_passport) # catch dangling passport

echo checker()