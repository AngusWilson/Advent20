input: read0 `:day16.txt

d16p1:{[input]
    split:1_/:(where ""~/:enlist[""],input) cut enlist[""],input;

    rules:split 0;
    rules:":" vs/:rules;
    rules:.[rules;(::;0);`$];
    rules:.[rules;(::;1);ssr[;"-";" "]];
    ruledict:rules[;0]!value each/: "or" vs/:rules[;1];

    tickets:value each 1_split 2

    sum raze tickets @' where each not any each (tickets) within/:\: raze value ruledict
    }



d16p2:{[input]
    split:1_/:(where ""~/:enlist[""],input) cut enlist[""],input;

    rules:split 0;
    rules:":" vs/:rules;
    rules:.[rules;(::;0);`$];
    rules:.[rules;(::;1);ssr[;"-";" "]];
    ruledict:rules[;0]!value each/: "or" vs/:rules[;1];

    tickets:value each 1_split 2;
    tickets:tickets where all each any each (tickets) within/:\: raze value ruledict;
    
    ids:(til count f)!{[f;ruledict;x] where all each any each (f[x]) within/:/: ruledict}[f;ruledict;] each til count f:flip tickets;

    while[count ids;
        loc:where 1=count each ids;
        identified,:loc!r:ids[loc];
        ids:loc _ids;
        ids:key[ids]!value[ids] except\: first r;
        ];
    
    prd (value split[1][1])where first each identified like\: "departure*"
    }
    
    
    
    
   
test:("class: 1-3 or 5-7";
    "row: 6-11 or 33-44";
    "seat: 13-40 or 45-50";
    "";
    "your ticket:";
    "7,1,14";
    "";
    "nearby tickets:";
    "7,3,47";
    "40,4,50";
    "55,2,20";
    "38,6,12")

test2:("class: 0-1 or 4-19";
    "row: 0-5 or 8-19";
    "seat: 0-13 or 16-19";
    "";
    "your ticket:";
    "11,12,13";
    "";
    "nearby tickets:";
    "3,9,18";
    "15,1,5";
    "5,14,9")

    
