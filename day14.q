
input:read0 `$"inputs/day14.txt"

test:("mask = XXXXXXXXXXXXXXXXXXXXXXXXXXXXX1XXXX0X";
    "mem[8] = 11";
    "mem[7] = 101";
    "mem[8] = 0")

test2:("mask = 000000000000000000000000000000X1001X";
    "mem[42] = 100";
    "mask = 00000000000000000000000000000000X0XX";
    "mem[26] = 1")

d14p1:{[input]
    mem:0 1!(0 0;0 0);
    i:0;
    while[i<count input;
        if[input[i] like "mask =*";
            mask:value ssr[raze " ",/:7_ input[i];"X";"0N"];
            ];
        if[input[i] like "mem*";
            binery:2 vs value last "= " vs input[i]; 
            mem[value first "]" vs 4_input[i]]:(((36-count binery)#0),binery)^mask;
            ];
        i+:1;
        ];

    sum 2 sv/: value 2_mem
    }

d12p2:{[input]
    numToBin:{[num]
        ((36-count binery)#0),binery:2 vs num
        };
        
    
    .mem.d : enlist[`]!(enlist 0);
    i:0;
    while[i<count input;
        if[input[i] like "mask =*";
            mask:7_input[i];
            ];
        if[input[i] like "mem*";
            num:value last "= " vs input[i];

            target:raze string numToBin value first "]" vs 4_input[i];
            j:0;
            m:mask;
            while[j<count m;
                if[m[j]="0";
                    m[j]:target[j]
                    ];
                j+:1
                ];
            a:((c- count each b)#\:0),'b:2 vs/: til `int$2 xexp c:sum"X"=m;
            addresses:{[m;x] @[m;where "X"=m;:;raze string x]}[m;] each a;
  
            {[num;x] .mem.d[x]:num}[num;] each `$addresses;
            ]
        i+:1;
        ];            
            
    sum value .mem.d
    }
