input:read0 `:day5.txt

seatID:{
    /Start at mid point, sum up pos/neg to take to new midpoint
    row:63.5+sum @[32 16 8 4 2 1 0.5;where "F"=x;neg];
    col:3.5+sum @[2 1 0.5;where "L"=-3#x;neg];
    col+row*8
    } 

d4p1:{[input]
    max seatID each input
    }

d4p2:{[input]
    //Find where jump of 2 in asc order of IDs. My seat is one below
    -1+ids where 2=deltas ids:asc seatID each input
    }
