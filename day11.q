input:read0 `:day11.txt

test:(
    "L.LL.LL.LL";
    "LLLLLLL.LL";
    "L.L.L..L..";
    "LLLL.LL.LL";
    "L.LL.LL.LL";
    "L.LLLLL.LL";
    "..L.L.....";
    "LLLLLLLLLL";
    "L.LLLLLL.L";
    "L.LLLLL.LL")

surrounding:{[i;h;w]
    nn:`e`w`sw`s`se`nw`n`ne!i+(1;-1;w-1;w;w+1;neg[w]-1;neg w;1-w);
    
    /If i is on a left boarder, nothing west
    nn:$[0=i mod w;`w`sw`nw _nn;nn];
    
    /IF i is on right boarder, nothing east
    nn:$[(w-1)=i mod w;`e`se`ne _nn;nn];
    
    /if i is on top, nothing north
    nn:$[i in til w;`n`ne`nw _nn;nn];
    
    /If i is on bottom, nothing south
    nn:$[i in (w*h)-til w+1;`s`sw`se _nn;nn];
    
    value nn

    }

applySeatRule:{[grid;i;h;w]
    if[("L"=grid[i]) and not any s:"#"=grid surrounding[i;h;w];
        :"#";
        ];
    if[("#"=grid[i]) and 3<sum s;
        :"L";
        ];
    grid[i]
    }
    

d11p1:{[input]
    h:count input;
    w:count first input;
    
    oldgrid:();
    newGrid:raze input;
    
    while[not oldgrid~newGrid;
        oldgrid:newGrid;
        newGrid:applySeatRule[oldgrid;;h;w] each til count oldgrid;
        ];
    sum "#"=newGrid
    }




    
getLoS:{[pos;h;w]
    c:`e`w`n`s`nw`ne`se`sw!pos+/:/: flip (0 1;0 -1;-1 0;1 0;-1 -1;-1 1;1 1;1 -1)*/: 1_til max (h;w);
    c where not()~/:c:{[x;h;w] x where all each x  within'\: (0,h;0,w)}[;h;w] each  c
    }

applySeatRulep2:{[grid;pos;h;w]  
    if[("L"=grid . pos) and not any s:any each "#"=first each (grid ./:/: getLoS[pos;h;w])except\: ".";
        :"#";
        ];
    if[("#"=grid . pos) and 4<sum s;
        :"L";
        ];
    grid . pos
    }

d11p2:{[input]
    h:count input;
    w:count first input;
    
    oldgrid:();
    newGrid:input;
    
    while[not oldgrid~newGrid;
        oldgrid:newGrid;
        newGrid:w cut applySeatRulep2[oldgrid;;h;w] each (til h)cross (til w);
        ];
    sum "#"=raze newGrid
    }

