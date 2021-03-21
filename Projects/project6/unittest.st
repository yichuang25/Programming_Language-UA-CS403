| a b |
a := Cuboid new.
a setname: 'Cube#1'.
a setlength: 2.
a setwidth: 4.
a setheight: 6.
a getArea printNl.
a getVolume printNl.
a getInfo.

b := #('type' '<' 'cyl' 'area' '<' '88' 'volume' '>' '10').
(a test: b) printNl.
