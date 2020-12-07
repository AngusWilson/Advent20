input:read0 `:day5.txt

seatID:{511.5+sum @[256 128 64 32 16 8 4 2 1 0.5;where x in\:"FL";neg]}

d5p1:{[input]
    max seatID each input
    }

d5p2:{[input]
    //Find where jump of 2 in asc order of IDs. My seat is one below
    -1+ids where 2=deltas ids:asc seatID each input
    }
