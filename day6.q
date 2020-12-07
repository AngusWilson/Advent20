input:read0 `:inputs/day6.txt

d6p1:{[input]
    sum count each distinct each raze each (where "" ~/: i) cut i:enlist[""],input
    }

d6p2:{[input]
    sum count each (inter/) each 1_/:(where "" ~/: i) cut i:enlist[""],input
    }
