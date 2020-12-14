input: read0 `:inputs/day12.txt

d12p1:{[input]
    inst:`$/:input[;0]
    n:"I"$1_/:input;

    d:inst,'n;
    absDdict:`n`s`e`w!sum each {[d;x] d[;1] where d[;0]=x}[d;] each `N`S`E`W;

    distDict:`n`s`e`w!(0 0 0 0);
    dir:`e;
    i:0;
    list:d where d[;0] in\: `L`R`F;

    while[i<=count list;
        if[`F=first list[i];
            distDict[dir]+:last list[i];
            ];

        if[`R=first list[i];
            dir:((c ? dir) rotate c) `int$(last list[i])%90;
            ];
        if[`L=first list[i];
            dir:((rc ? dir) rotate rc) `int$(last list[i])%90;
            ];
        i+:1;
        ];

    (abs (distDict[`e] - distDict[`w]) + absDdict[`e] - absDdict[`w] ) + abs (distDict[`n] - distDict[`s]) + absDdict[`n] - absDdict[`s]
    }

d12p2:{[input]
    
    pos:`e`n!0 0;
    wp:`e`n!10 1;
    inst:`$/:input[;0];
    n:"I"$1_/:input;
    i:0;
    list:inst,'n;
    while[i<count list;
        if[`F=list[i] 0;
            mv:wp*list[i] 1;
            pos+:mv;
            ];
        if[(list[i] 0) in `N`E`S`W;
            wp+:(list[i] 1)*`e`n!(`N`E`S`W!(0 1;1 0;0 -1;-1 0)) list[i] 0;
            ];
        
        if[`R=list[i] 0;
            do[`int$(list[i] 1)%90;wp:`e`n!(wp[`n];neg wp[`e])];
            ];
        if[`L=list[i] 0;            
            do[`int$(list[i] 1)%90;wp:`e`n!(neg wp[`n];wp[`e])];     
            ];      
        i+:1;
        ];
    sum abs value pos
    }

