input:read0 `:inputs/day4.txt

test:(
    "ecl:gry pid:860033327 eyr:2020 hcl:#fffffd";
    "byr:1937 iyr:2017 cid:147 hgt:183cm";
    "";
    "iyr:2013 ecl:amb cid:350 eyr:2023 pid:028048884";
    "hcl:#cfa07d byr:1929";
    "";
    "hcl:#ae17e1 iyr:2013";
    "eyr:2024";
    "ecl:brn pid:760753108 byr:1931";
    "hgt:179cm";
    "";
    "hcl:#cfa07d eyr:2025 pid:166559648";
    "iyr:2011 ecl:brn hgt:59in")


parseInput:{[input]
    //Turn text file into a list of dictionaries
    flat:trim " " sv/: (where""~/:input) cut input:enlist[""],input;
    (`$d[;0])!'(d:flip each ":" vs/:/: " " vs/: flat)[;1]
    }

d4p1:{[input]
    dicts:parseInput[input];
    
    sum 7=count each (key each dicts) except\: `cid
    }


validate:{[dict]
    //Create validation rules for each field
    all(
        ("I"$dict`byr) within 1920 2002;
        ("I"$dict`iyr) within 2010 2020;
        ("I"$dict`eyr) within 2020 2030;
        $["in"~-2#dict[`hgt];("I"$-2_dict[`hgt])within 59 76;("I"$-2_dict[`hgt])within 150 193];
        ("#"~first dict`hcl)and (all (1_dict`hcl) in\: "0123456789abcdef") and 7=count dict`hcl;
        (`$dict[`ecl]) in `amb`blu`brn`gry`grn`hzl`oth;
        (9=count dict[`pid]) and all dict[`pid] in\: "1234567890")
    }
    
d4p2:{[input]
    dicts:parseInput[input];
    
    //Run each dict through validation, err trapped as if cast etc fails it is due to misformatted ppt
    sum @[validate;;{0b}] each dicts
    }