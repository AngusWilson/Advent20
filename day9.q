input:read0 `:day9.txt

parseInput:{[input]
    "J"$input
    }

d9p1:{[input]
    input:parseInput[input];
    
    i:25;
    
    while[input[i] in sum each a cross a:-25#(i)#input;
        i+:1;
        ];
    
    input i
    };


d9p2:{[input]
    number:d9p1[input];
    input:parseInput[input];
    
    startInd:0;
    numrange:0;
    summed:0;
    /while sum doesn't = number, add another to the start
    while[not number = summed;
        summed:0;
        /while is less than num, add another to the range
        while[number>summed;
            numrange+:1;
            summed:sum (n:numrange)#(s:startInd) _input;
            ];
            
        startInd+:1;
        numrange:0;

        ];
    
    (max r)+min r:n#(s) _input
    }
    
