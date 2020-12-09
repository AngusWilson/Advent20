input:value each read0 `:inputs/day1.txt

test:1721 979 366 299 675 1456


//Using cross to vectorise
d1p1:{[input]
    prd c first where 2020 =sum each c:input cross input
    }

d1p2:{[input]
    prd c first where 2020 =sum each c:input cross input cross input 
    }


//Using loops - lower mem consumption
d1p1:{[input]
    i:0;
    while[not any match:2020=input[i]+/:input;
        i+:1;
        ];

    input[i]*first input where match
    }


d1p2:{[input]
    i:0;
    j:0;
    while[not any match:2020=(input[i]+input[j])+/:input;
        j+:1;
        if[j=200;
            i+:1;
            j:0;
            ];
        ];

    input[i]*input[j]*first input where match
    }

