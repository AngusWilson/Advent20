input:read0 `:day18.txt

test:("1 + 2 * 3 + 4 * 5 + 6";
    "1 + (2 * 3) + (4 * (5 + 6))";
    "2 * 3 + (4 * 5)";
    "5 + (8 * 3 + 9 + 3 * 4 * 3) ";
    "5 * 9 * (7 * 3 * 3 + 9 * 3 + (8 + 6 * 4))";
    "((2 + 4 * 9) * (6 + 9 * 8 + 6) + 6) + 2 + 4 * 2")


d18p1:{
    sum {value reverse ssr[ssr[ssr[x;"(";" # "];")";" ( "];"#";")"]} each input 
    }


calcp2:{[x]
    x:x except " ";
    while[any  "()+" in\: x;  
        //Resolve any adds 
        while[
            [adds:(x addInds:(0,where not 1=deltas l) cut l:where x in .Q.n,"+");
                plusTrims:"+"=adds[;0];
                adds:@[adds;where plusTrims;{1_x}];
                num:value adds rep:first where ("+" in/:adds) and (first each adds in .Q.n) and last each adds in .Q.n;
                not null rep
                ];
            x:((plusTrims[rep]+(addInds rep)[0]) #x),string[num],(1+last addInds rep) _x;
            ];

        if[any  "()" in\: x;
            /resolve any bracketing   
            open:where x="(";
            close:where x=")";
            paired:();
            i:0;
            while[i<count close;
                paired,:open last where open<close[i];
                open:open except paired;
                i+:1;
                ];
            bracketGroups:paired,'close;

            topLevel:first bracketGroups where 1=sum each 2=sum each/: bracketGroups within/: bracketGroups;
            x:((topLevel[0])#x),(string value {1_(y[1]-y[0])#y[0]_x}[x;]topLevel),(topLevel[1]+1)_x; 
            ];
        ];
    value x
    }   

d18p2:{[input]
    sum calcp2 each input    
    }
