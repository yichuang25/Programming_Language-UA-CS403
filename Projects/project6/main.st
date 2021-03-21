(Smalltalk arguments size ~= 1)
ifTrue: [
    'Usage: shape_file' printNl.
    ^ObjectMemory quit.
].

"(Smalltalk arguments at: 1) printNl."


f := FileStream open: (Smalltalk arguments at: 1) mode: #read
ifFail: [
    'Fail to open file' printNl.
    ^ObjectMemory quit.
].
|b ws|
ws := WriteStream on: Array new.
b := f nextLine.
[f atEnd] whileFalse:
    [
        "b displayNl."
        ws nextPut: b.
        "ws size printNl."
        b := f nextLine.
        
    ].
"b displayNl."
ws nextPut: b.
f close.

"ws contents displayNl."
|slist i tset|
tset := Set new.
tset add: 'sphere'. tset add: 'cone'. tset add: 'cylinder'. tset add: 'cuboid'.
slist := Array new: (ws size).
i := 1.
[i <= slist size]
whileTrue: [
    |t c name type|
    t := (ws contents at: i) asString.
    "t printNl."
    t := t subStrings.
    "t printNl.
    t size printNl."
    name := t at: 1.
    type := t at: 2.
    (tset includes: type)
    ifFalse: [
        'No such shape' displayNl.
    ]
    ifTrue: [
        (type = 'sphere')
        ifTrue: [
            |sph r|
            r := t at: 3.
            sph := Sphere new.
            sph setname: name.
            sph setradius: r asNumber.
            "sph getInfo."
            slist at: i put: sph.
        ].
        (type = 'cone')
        ifTrue: [
            |cone r h|
            r := t at: 3.
            h := t at: 4.
            cone := Cone new.
            cone setname: name.
            cone setradius: r asNumber.
            cone setheight: h asNumber.
            "cone getInfo."
            slist at: i put: cone.
        ].
        (type = 'cylinder')
        ifTrue: [
            |cyl r h|
            r := t at: 3.
            h := t at: 4.
            cyl := Cylinder new.
            cyl setname: name.
            cyl setradius: r asNumber.
            cyl setheight: h asNumber.
            "cyl getInfo."
            slist at: i put: cyl.
        ].
        (type = 'cuboid')
        ifTrue: [
            |cub l w h|
            l := t at: 3.
            w := t at: 4.
            h := t at: 5.
            cub := Cuboid new.
            cub setname: name.
            cub setlength: l asNumber.
            cub setwidth: w asNumber.
            cub setheight: h asNumber.
            "cub getInfo."
            slist at: i put: cub.
        ].
    ].
    i := i + 1.
].
slist printNl.
|command actset|
actset := Set new.
actset add: 'print'. actset add: 'count'. actset add: 'min'. actset add: 'max'. actset add: 'total'. actset add: 'avg'.
actset printNl.
'Enter a command: ' displayNl.
command := stdin nextLine.
[command = 'quit']
whileFalse: [
    |num stp act cond|
    num := 1.
    stp := 0.
    [num <= command size]
    whileTrue: [
        ((command at: num) isDigit)
        ifTrue: [
            stp := num.
            num := command size.
        ].
        num := num + 1.
    ].
    (stp > 0)
    ifFalse: [
        act := command.
        cond := 0.
    ]
    ifTrue: [
        |p1 p2 p3 p4 p5|
        p1 := command substrings: (command at: stp).
        act := p1 at: 1.
        stp := stp - 1.
        p2 := command substrings: (command at: stp).
        p3 := p2 at: 2.
        p4 := 1.
        p5 := 1.
        [p4 <= p3 size]
        whileTrue: [
            ((p3 at: p4) isDigit)
            ifFalse: [
                p5 := 0.
            ].
            p4 := p4 + 1.
        ].
        (p5 = 0)
        ifTrue: [
            cond := -1.
        ]
        ifFalse: [
            cond := (p2 at: 2) asNumber.
        ].
    ]. 
    "act printNl."
    "cond printNl."

    ((actset includes: act) & (cond >= 0))
    ifFalse: [
        'Action:' display. command display. ' is not valid.' displayNl.
    ]
    ifTrue: [
        'Is action' displayNl.
        (act = 'count')
        ifTrue: [
            |t1 result|
            t1 := 1.
            [t1 <= cond]
            whileTrue: [
                |c1|
                'Enter test condition #' display. t1 display. ': ' displayNl.
                c1 := stdin nextLine.
                c1 printNl.

                t1 := t1 + 1.
            ]
        ].
        (act = 'print')
        ifTrue: [

        ].
        (act = 'min')
        ifTrue: [

        ].
        (act = 'max')
        ifTrue: [

        ].
        (act = 'total' | act = 'avg')
        ifTrue: [

        ].
    ].


    'Enter a command: ' displayNl.
    command := stdin nextLine.
].