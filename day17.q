test:(
    ".#.";
    "..#";
    "###")

input:(
   "....#...";
   ".#..###.";
   ".#.#.###";
   ".#....#.";
   "...#.#.#";
   "#.......";
   "##....#.";
   ".##..#.#")


calcArea:{[stage;input]
    boundarea:(0 0 0;(count first input;count input;0))+'(-1;1)*stage;
    a:boundarea[0]+(til each boundarea[1]+1-boundarea[0]);
    a[0] cross a[1] cross a 2
    }

nn:{[pos]
    pos+/:a where not ( 0 0 0) ~/: a:(-1 0 1 cross -1 0 1 cross -1 0 1)
    }


newState:{[pos;state]
    if[state[pos] and (sum state nn pos) in 2 3;
        :1b;
        ];
    if[(not state[pos]) and 3= sum state nn pos;
        :1b;
        ];
    0b
    }


d17p1:{[input]
    state:(`u#loc,\:0)!"#"=input ./: loc:(til count first input) cross til count input;

    initial:(`u#k)!(count k:calcArea[6;input])#0b;

    state:initial,state;

    do[6;
        state:k!newState[;state] each k:key state;
        ];

    sum value state
    }






calcArea4d:{[stage;input]
    boundarea:(0 0 0 0;(count first input;count input;0;0))+'(-1;1)*stage;
    a:boundarea[0]+(til each boundarea[1]+1-boundarea[0]);
    a[0] cross a[1] cross a[2] cross a[3]
    }

nn4d:{[pos]
    pos+/:a where not (0 0 0 0) ~/: a:(-1 0 1 cross -1 0 1 cross -1 0 1 cross -1 0 1)
    }


newState4d:{[pos;state]
    if[state[pos] and (sum state nn pos) in 2 3;
        :1b;
        ];
    if[(not state[pos]) and 3= sum state nn pos;
        :1b;
        ];
    0b
    }


d17p2:{[input]
    state:(`u#loc,\:0 0)!"#"=input ./: loc:(til count first input) cross til count input;

    initial:(`u#k)!(count k:calcArea4d[6;input])#0b;

    state:initial,state;

    do[6;
        state:k!newState4d[;state] each k:key state;
        ];

    sum value state
    }

