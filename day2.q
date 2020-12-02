input:read0 `:inputs/day2.txt

test:("1-3 a: abcde";
      "1-3 b: cdefg";
      "2-9 c: ccccccccc")


parseInput:{[input]
    //Parse
    split:": " vs/: input;
    passwords:split[;1];
    letter:first each(split:" " vs/:split[;0])[;1];
    range:value each ssr[;"-";" "] each split[;0];
    
    `split`passwords`letter`range!(split;passwords;letter;range)
    }

d2p1:{[input]
    //Parse
    d:parseInput[input];
    passwords:d`passwords;
    letter:d`letter;
    range:d`range;

    //Group and count letters in passwords, check if within range given
    sum ((count each/:group each passwords)@'letter) within' range 
    }

d2p2:{[input]
    //Parse
    d:parseInput[input];
    passwords:d`passwords;
    letter:d`letter;
    locations:d`range;    
    
    //Get locations of letter in password, remove locations from given position list. If one left it satisfies
    sum 1=count each (locations-1) except'where each letter='passwords
    }