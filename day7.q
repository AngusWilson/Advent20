input:read0 `:inputs/day7.txt

/Helper func to get outer bags
getKeys:{[dict;x] string raze `${[dict;x] where dict like "*",x,"*"}[dict;] each x};

d7p1:{[input]
    /Create dict of outer bag and content string
    dict:(!). flip " bags contain " vs/: input;

    outer:bags:enlist"shiny gold";
    
    /Loop over, keeping list of all outer bags
    while[count outer;
        bags:distinct bags,outer:(getKeys[dict;outer]) except bags;
        ];

    -1+count bags
    }

d7p2:{[input]
    /Make dict but sym the key
    dict:(!). @[flip " bags contain " vs/: input;0;`$];

    bags:enlist(1;`$"shiny gold");

    /Loop over until end of tree
    while[count bags;
        bags:raze {
            /Parse and split
            split:" "vs/:ssr[;", ";""] each ssr[;"s, ";""] each -1_" bag" vs dict[x 1]; 
            
            /Spit out better format for ent of tree
            if[raze[split]~("no";"other");
                :enlist(0;`other);
                ];

            /Join name to number, and multiply by parent bag number
            newBags:(value each split[;0]),'`$" " sv/: split[;1 2];
            .[newBags;(::;0);x[0]*]
            } each bags except enlist (0;`other);
        
        /If it's not end of tree then add to count
        if[count bags;
            bagTotal+:sum bags[;0];
            ];
        ];
    
    bagTotal
    }
