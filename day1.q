input:value each read0 `:inputs/day1.txt

test:1721 979 366 299 675 1456


//Loop over combinations and check if it sums to 2020 then multiply.
/Tried using 'cross' to create combinations and solve as a vector calculation but was too memory intensive

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

