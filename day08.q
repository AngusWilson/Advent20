input:read0`:day8.txt

test:(
    "nop +0";
    "acc +1";
    "jmp +4";
    "acc +3";
    "jmp -3";
    "acc -99";
    "acc +1";
    "jmp -4";
    "acc +6")

parseInput:{[input]
    split:" " vs/: input;
    split:.[split;(::;1);{value"0",x}];
    instructions:.[split;(::;0);`$];
    instructions
    };

d8p1:{[input]
    instructions:parseInput[input];
    prevloc:();
    i:0;
    total:0;
    while[not i in prevloc;
        prevloc,:i;

        if[`acc~instructions[i;0];
            total+:instructions[i;1];
            ];

        if[instructions[i;0] in `nop`acc;
            new:i+1;
            ];

        if[`jmp~instructions[i;0];
            new:i+instructions[i;1];
            ];

        i:new;
        ];
    total
    }

d8p2:{[input]

    /Generate replacement nop/jmp
    instructions:parseInput[input];
    nopswap:{.[x;(y;0);:;`nop]}[instructions;] each where `jmp=instructions[;0];
    jmpswap:{.[x;(y;0);:;`jmp]}[instructions;] each where `nop=instructions[;0];
    
    comb:nopswap,jmpswap;
    
    j:0;
    i:0;
    instructions:first comb;
    while[i within (0;-1+count instructions);
        
        prevloc:();
        i:0;
        total:0;
        while[(not i in prevloc) and i within (0;-1+count instructions);
            
            prevloc,:i;

            if[`acc~instructions[i;0];
                total+:instructions[i;1];
                ];

            if[instructions[i;0] in `nop`acc;
                new:i+1;
                ];

            if[`jmp~instructions[i;0];
                new:i+instructions[i;1];
                ];

            i:new;
            ];
        j+:1;
        instructions:comb[j];
        ];
    total
    }
