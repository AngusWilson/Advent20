input:read0 `:inputs/day13.txt

test:("939";"7,13,x,x,59,x,31,19")

d13p1:{[input]
    t:value first input;
    n:value each n where not enlist["x"]~/:n:("," vs last input);

    wait*first n where w= wait:min w:n-'t mod n
    }


d13p2:{[input]
    n:value each n i:where not enlist["x"]~/:n:("," vs last input);
    i:i idesc n;
    n:n idesc n;
    reli:i-i first where n=max n;
    
    ind:1;
    t:iterator:max n;
    while[ind<count n;
        if[0=(t+ reli ind ) mod (n ind);
            iterator:iterator* n ind;
            ind+:1;
            ];
        t+:iterator;
        ];
    t-iterator+i first where n=max n
    }
