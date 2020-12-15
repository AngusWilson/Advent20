input:(5 1 9 18 13 8 0)

d15p1:{[list]

    i:count[list]-1;
    while[i<2020;
        if[notspoken:1=sum list[i]= list;
            list,:0;
            ];
        if[not notspoken;
            list,:neg(-). -2#where list=list[i];
            ];
        i+:1;
        ];
        list 2019
    }

d15p2:{[input]
    lastDict:(`u#i)!til count i:-1_input;
    num:0;
    turn:count lastDict;
    while[turn<30000000-1;
        prevNum:lastDict[num];
        lastDict[num]:turn;
        num:0^turn-prevNum;
        turn+:1;
        ];
    num
    }
