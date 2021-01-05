import re, strutils

echo "Passports Part 1"

proc is_valid(current_passport: tuple): int =
    result = 1
    for value in current_passport.fields():
        if value == "invalid":
            result = 0

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