import algorithm, math

echo "Boarding"

proc find_row(seat: string): int = 
    var max_row = 127f
    var min_row = 0f

    for r in seat:
        let half = math.ceil((max_row - min_row) / 2)
        if r == 'F':
            max_row = max_row - half
        elif r == 'B':
            min_row = min_row + half
        if max_row == min_row:
            return max_row.toInt()
    return 0

proc find_col(seat: string): int =
    var min_col = 0f
    var max_col = 7f

    for c in seat:
        let half = math.ceil((max_col - min_col) / 2)
        if c == 'R':
            min_col = min_col + half
        elif c == 'L':
            max_col = max_col - half
        if max_col == min_col:
            return max_col.toInt
    return 0

proc find_seats(seats: var seq[int]) =
    for seat in "input".lines:
       var seat_id = find_row(seat) * 8 + findcol(seat)
       seats.add(seat_id)
    
    seats.sort()
    echo seats.max, " seats."

proc find_missing_seat(seats: var seq[int]) =
    for i in countup(1,len(seats)-2): # last seat can be ignored
        let lastseat = seats[i-1] 
        let currentseat = seats[i]
        let nextseat = seats[i+1]

        if lastseat == currentseat - 1 and nextseat == currentseat + 1:
            continue
        echo "invalid seat: ", currentseat

var seats: seq[int]
find_seats(seats)
find_missing_seat(seats)
