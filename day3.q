system"cd /home/awilson1/Advent20/"

input:read0 `:inputs/day3.txt

test:(
    "..##.......";
    "#...#...#..";
    ".#....#..#.";
    "..#.#...#.#";
    ".#...##..#.";
    "..#.##.....";
    ".#.#.#....#";
    ".#........#";
    "#.##...#...";
    "#...##....#";
    ".#..#...#.#")

//Generate list of indicies, use mod to wrap around x axis. Sum where is hash
d3p1:{[input]
    sum"#"=input ./:(vertical),'(3*vertical:til count input) mod count input 0
    }

//Part 2 routes
routes:(1 1;
        3 1;
        5 1;
        7 1;
        1 2)

//Retructure to generate x and y position lists
routeTrees:{[input;xMove;yMove]
    yPos:yMove*til floor(count input)%yMove;
    hPos:(xMove*(til count input)) mod count input 0;
    sum"#"=input ./:yPos,'(count yPos)#hPos
    }

d3p2:{[input;routes]
    prd routeTrees[input;;] ./: routes
    }
