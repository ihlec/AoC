import re, tables, strutils

echo "Bags"

var bags = initTable[string, seq[string]]()

proc checker(outer_bag: seq[string], target: string): int =
    for bag in outer_bag:
        if bag[2..bag.high] == target:
            return 1
        else:
            # check inner bag
            if checker(bags[bag[2..<bag.len]], target) == 1:
                return 1
    return 0

proc total_bags(outer_bag: seq[string]): int =
    result = 1
    for bag in outer_bag:
        var number_matches: array[1, string]
        if match(bag, re"(\d)", number_matches):
            var number = number_matches[0].parseInt()
            try:
                result += number * total_bags(bags[bag[2..<bag.len]])
            except KeyError:
                result += number 

# parse bags 
for line in "input".lines:
    let bag_name_regex = re"(\w+\s\w+).*"
    let bag_content_regex = re"\d\s(\w+\s\w+)"
    var bag_name_matches: array[1, string]

    if match(line, bag_name_regex, bag_name_matches):
        bags[bag_name_matches[0]] = findAll(line, bag_content_regex)

# part 1
var counter = 0
for outerbag in bags.values:
    counter += checker(outerbag, "shiny gold")
echo counter

# part 2
echo total_bags(bags["shiny gold"]) - 1 # substract shiny gold bag







    








 


