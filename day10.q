input:"I"$read0 `:day10.txt

d10p1:{[input]
    (1+sum 3=d)*sum 1=d:deltas asc input
    }

d10p2:{[input]
    /Check deltas, cut on, and remove any 3s as they have to be there.
    /Create groups of 1s
    /Map the count of the groups to permutations of arrangements of the group. i.e. 3 ones can be 111 12 21
    /multiply num of perms to get total arangements
    
    prd (4 3 2 1!7 4 2 1)count each a where 0<count each a:((0,where 3=d) cut d:deltas asc input) except\: 3
    }
