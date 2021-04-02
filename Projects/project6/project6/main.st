(Smalltalk arguments size ~= 1)
ifTrue: [
    'Usage: shape.st sphere.st cylinder.st cone.st cuboid.st -f main.st shape_file' printNl.
    ^ObjectMemory quit.
].

"(Smalltalk arguments at: 1) printNl."


f := FileStream open: (Smalltalk arguments at: 1) mode: #read
ifFail: [
    'Unable to open ' print.
    (Smalltalk arguments at: 1) display.
    ' for reading.' printNl.
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
    t := ws contents at: i.
    (t = nil)
    ifTrue: [
        'There is no shape in the file' displayNl.
        ^ObjectMemory quit.
    ].
    t := (ws contents at: i) asString.
    
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
"slist printNl."
|command actset names ops| 
actset := Set new.
actset add: 'print'. actset add: 'count'. actset add: 'min'. actset add: 'max'. actset add: 'total'. actset add: 'avg'.
"actset printNl."

names := Set new.
names add: 'type'. names add: 'area'. names add: 'volume'.
"names printNl."

ops := Set new.
ops add: '=='. ops add: '!='. ops add: '>='. ops add: '<='. ops add: '>'. ops add: '<'.
"ops printNl."

"command := ''.
'Enter a command: ' display.
command := stdin nextLine."
command := ''.
[command ~= 'quit']
whileTrue: [
    |num stp act cond|
    'Enter a command: ' display.
    command := stdin nextLine.
    "command displayNl."
    (command = 'quit')
    ifTrue: [
        ^ObjectMemory quit.
    ].
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
        "'Is action' displayNl."
        (act = 'count')
        ifTrue: [
            |t1 conditions total|
            (cond > 0)
            ifTrue: [
                total := cond * 3.
                "total printNl."
                conditions := Array new: total.
            ].
            "cond printNl."
            t1 := 1.
            [t1 <= cond]
            whileTrue: [
                |c1 c2 cname op val flag|
                flag := 0.
                c1 := ''.
                'Enter test condition #' display. t1 display. ': ' display.
                c1 := stdin nextLine.
                "c1 printNl."
                
                c1 := c1 substrings.
                
                (c1 size = 3)
                ifTrue: [
                    cname := c1 at: 1.
                    op := c1 at: 2.
                    val := c1 at: 3.
                    "cname printNl. op printNl. val printNl."
                ]
                ifFalse: [
                    flag := 1.
                ].
                
                
                ((names includes: cname) & (ops includes: op) & (flag = 0))
                ifFalse: [
                    flag := 1.
                ].

                (flag = 1)
                ifTrue: [
                    'Invalid format' displayNl.
                ].

                (flag = 0)
                ifTrue: [
                    |c2|
                    c2 := ((t1-1) * 3) + 1.
                    conditions at: c2 put: cname.
                    c2 := c2 + 1.
                    conditions at: c2 put: op.
                    c2 := c2 + 1.


                ].

                (flag = 0)
                ifTrue: [
                    c2 := ((t1-1) * 3) + 1.
                    conditions at: c2 put: cname.
                    c2 := c2 + 1.
                    conditions at: c2 put: op.
                    c2 := c2 + 1.
                    conditions at: c2 put: val.

                    t1 := t1 + 1.
                ].
            ].
            (cond = 0)
            ifTrue: [
                'There are ' display.
                slist size print.
                ' shapes.' displayNl
            ]
            ifFalse: [
                |result i shape totals|
                totals := 0.

                i := 1.
                [i <= slist size]
                whileTrue: [
                    shape := (slist at: i).
                    "shape printNl."
                    (shape test: conditions)
                    ifTrue: [
                        totals := totals + 1.
                        "shape printNl."
                    ].
                    i := i + 1.
                ].
                
                'There are ' display.
                totals print.
                ' shapes.' displayNl

            ].
        ].
        (act = 'print')
        ifTrue: [
            |t1 conditions total|
            (cond > 0)
            ifTrue: [
                total := cond * 3.
                "total printNl."
                conditions := Array new: total.
            ].
            "cond printNl."
            t1 := 1.
            [t1 <= cond]
            whileTrue: [
                |c1 c2 cname op val flag|
                flag := 0.
                c1 := ''.
                'Enter test condition #' display. t1 display. ': ' display.
                c1 := stdin nextLine.
                c1 printNl.

                c1 := c1 substrings.
                
                (c1 size = 3)
                ifTrue: [
                    cname := c1 at: 1.
                    op := c1 at: 2.
                    val := c1 at: 3.
                    "cname printNl. op printNl. val printNl."
                ]
                ifFalse: [
                    flag := 1.
                ].
                
                
                ((names includes: cname) & (ops includes: op) & (flag = 0))
                ifFalse: [
                    flag := 1.
                ].

                (flag = 1)
                ifTrue: [
                    'Invalid format' displayNl.
                ].

                (flag = 0)
                ifTrue: [
                    |c2|
                    c2 := ((t1-1) * 3) + 1.
                    conditions at: c2 put: cname.
                    c2 := c2 + 1.
                    conditions at: c2 put: op.
                    c2 := c2 + 1.


                ].

                (flag = 0)
                ifTrue: [
                    c2 := ((t1-1) * 3) + 1.
                    conditions at: c2 put: cname.
                    c2 := c2 + 1.
                    conditions at: c2 put: op.
                    c2 := c2 + 1.
                    conditions at: c2 put: val.

                    t1 := t1 + 1.
                ].
            ].
            (cond = 0)
            ifTrue: [
                |i|
                i := 1.
                
                [i <= slist size]
                whileTrue: [
                    shape := (slist at: i).
                    shape getInfo.

                    i := i + 1.
                ].
            ]
            ifFalse: [
                |result i shape totals|
                totals := 0.

                i := 1.
                [i <= slist size]
                whileTrue: [
                    shape := (slist at: i).
                    "shape printNl."
                    (shape test: conditions)
                    ifTrue: [
                        shape getInfo.
                    ].
                    i := i + 1.
                ].

            ].
        ].
        (act = 'min')
        ifTrue: [
            |t1 conditions total|
            (cond > 0)
            ifTrue: [
                total := cond * 3.
                "total printNl."
                conditions := Array new: total.
            ].
            "cond printNl."
            t1 := 1.
            [t1 <= cond]
            whileTrue: [
                |c1 c2 cname op val flag|
                flag := 0.
                c1 := ''.
                'Enter test condition #' display. t1 display. ': ' display.
                c1 := stdin nextLine.
                "c1 printNl."

                c1 := c1 substrings.
                
                (c1 size = 3)
                ifTrue: [
                    cname := c1 at: 1.
                    op := c1 at: 2.
                    val := c1 at: 3.
                    "cname printNl. op printNl. val printNl."
                ]
                ifFalse: [
                    flag := 1.
                ].
                
                
                ((names includes: cname) & (ops includes: op) & (flag = 0))
                ifFalse: [
                    flag := 1.
                ].

                (flag = 1)
                ifTrue: [
                    'Invalid format' displayNl.
                ].

                (flag = 0)
                ifTrue: [
                    |c2|
                    c2 := ((t1-1) * 3) + 1.
                    conditions at: c2 put: cname.
                    c2 := c2 + 1.
                    conditions at: c2 put: op.
                    c2 := c2 + 1.


                ].

                (flag = 0)
                ifTrue: [
                    c2 := ((t1-1) * 3) + 1.
                    conditions at: c2 put: cname.
                    c2 := c2 + 1.
                    conditions at: c2 put: op.
                    c2 := c2 + 1.
                    conditions at: c2 put: val.

                    t1 := t1 + 1.
                ].
            ].

            (cond = 0)
            ifTrue: [
                |area minArea vol minVol i shape|
                i := 1.
                [i <= slist size]
                whileTrue:[
                    shape := (slist at: i).
                    area := shape getArea.
                    vol := shape getVolume.
                    (i = 1)
                    ifTrue: [
                        minArea := area.
                        minVol := vol.
                    ]
                    ifFalse: [
                        (area < minArea)
                        ifTrue: [
                            minArea := area.
                        ].
    
                        (vol < minVol)
                        ifTrue: [
                            minVol := vol.
                        ].
                        
                    ].
                    i := i + 1.
                ].
                'min(Surface area)= ' display.
                minArea printNl.

                'min(Volume)= ' display.
                minVol printNl.
            ]
            ifFalse: [
                |area minArea vol minVol i shape flag|
                minArea := -1.
                minVol := -1.
                flag := 0.
                i := 1.
                [i <= slist size]
                whileTrue: [
                    shape := (slist at: i).
                    area := shape getArea.
                    vol := shape getVolume.

                    (shape test: conditions)
                    ifTrue: [
                        (flag = 0)
                        ifTrue: [
                            minArea := area.
                            minVol := vol.
                            flag := flag + 1.
                        ]
                        ifFalse: [
                            (area < minArea)
                            ifTrue: [
                                minArea := area.
                            ].
                            (vol < minVol)
                            ifTrue: [
                                minVol := vol.
                            ].
                        ].
                    ].

                    i := i + 1.
                ].
                (flag = 0)
                ifTrue: [
                    'There are no shapes satisfying the condition(s)' displayNl.
                ]
                ifFalse: [
                    'min(Surface area)= ' display.
                    minArea printNl.

                    'min(Volume)= ' display.
                    minVol printNl.
                ].
            ].

        ].
        (act = 'max')
        ifTrue: [
            |t1 conditions total|
            (cond > 0)
            ifTrue: [
                total := cond * 3.
                "total printNl."
                conditions := Array new: total.
            ].
            "cond printNl."
            t1 := 1.
            [t1 <= cond]
            whileTrue: [
                |c1 c2 cname op val flag|
                flag := 0.
                c1 := ''.
                'Enter test condition #' display. t1 display. ': ' display.
                c1 := stdin nextLine.
                "c1 printNl."

                c1 := c1 substrings.
                
                (c1 size = 3)
                ifTrue: [
                    cname := c1 at: 1.
                    op := c1 at: 2.
                    val := c1 at: 3.
                    "cname printNl. op printNl. val printNl."
                ]
                ifFalse: [
                    flag := 1.
                ].
                
                
                ((names includes: cname) & (ops includes: op) & (flag = 0))
                ifFalse: [
                    flag := 1.
                ].

                (flag = 1)
                ifTrue: [
                    'Invalid format' displayNl.
                ].

                (flag = 0)
                ifTrue: [
                    |c2|
                    c2 := ((t1-1) * 3) + 1.
                    conditions at: c2 put: cname.
                    c2 := c2 + 1.
                    conditions at: c2 put: op.
                    c2 := c2 + 1.


                ].

                (flag = 0)
                ifTrue: [
                    c2 := ((t1-1) * 3) + 1.
                    conditions at: c2 put: cname.
                    c2 := c2 + 1.
                    conditions at: c2 put: op.
                    c2 := c2 + 1.
                    conditions at: c2 put: val.

                    t1 := t1 + 1.
                ].
            ].

            (cond = 0)
            ifTrue: [
                |area maxArea vol maxVol i shape|
                i := 1.
                [i <= slist size]
                whileTrue:[
                    shape := (slist at: i).
                    area := shape getArea.
                    vol := shape getVolume.
                    (i = 1)
                    ifTrue: [
                        maxArea := area.
                        maxVol := vol.
                    ]
                    ifFalse: [
                        (area > maxArea)
                        ifTrue: [
                            maxArea := area.
                        ].
    
                        (vol > maxVol)
                        ifTrue: [
                            maxVol := vol.
                        ].
                        
                    ].
                    i := i + 1.
                ].
                'max(Surface area)= ' display.
                maxArea printNl.

                'max(Volume)= ' display.
                maxVol printNl.
            ]
            ifFalse: [
                |area maxArea vol maxVol i shape flag|
                maxArea := -1.
                maxVol := -1.
                flag := 0.
                i := 1.
                [i <= slist size]
                whileTrue: [
                    shape := (slist at: i).
                    area := shape getArea.
                    vol := shape getVolume.

                    (shape test: conditions)
                    ifTrue: [
                        (flag = 0)
                        ifTrue: [
                            maxArea := area.
                            maxVol := vol.
                            flag := flag + 1.
                        ]
                        ifFalse: [
                            (area > maxArea)
                            ifTrue: [
                                maxArea := area.
                            ].
                            (vol > maxVol)
                            ifTrue: [
                                maxVol := vol.
                            ].
                        ].
                    ].

                    i := i + 1.
                ].
                (flag = 0)
                ifTrue: [
                    'There are no shapes satisfying the condition(s)' displayNl.
                ]
                ifFalse: [
                    'max(Surface area)= ' display.
                    maxArea printNl.

                    'max(Volume)= ' display.
                    maxVol printNl.
                ].
            ].
        ].
        ((act = 'total') | (act = 'avg'))
        ifTrue: [
            |t1 conditions total|
            (cond > 0)
            ifTrue: [
                total := cond * 3.
                "total printNl."
                conditions := Array new: total.
            ].
            "cond printNl."
            t1 := 1.
            [t1 <= cond]
            whileTrue: [
                |c1 c2 cname op val flag|
                flag := 0.
                c1 := ''.
                'Enter test condition #' display. t1 display. ': ' display.
                c1 := stdin nextLine.
                "c1 printNl."

                c1 := c1 substrings.
                
                (c1 size = 3)
                ifTrue: [
                    cname := c1 at: 1.
                    op := c1 at: 2.
                    val := c1 at: 3.
                    "cname printNl. op printNl. val printNl."
                ]
                ifFalse: [
                    flag := 1.
                ].
                
                
                ((names includes: cname) & (ops includes: op) & (flag = 0))
                ifFalse: [
                    flag := 1.
                ].

                (flag = 1)
                ifTrue: [
                    'Invalid format' displayNl.
                ].

                (flag = 0)
                ifTrue: [
                    |c2|
                    c2 := ((t1-1) * 3) + 1.
                    conditions at: c2 put: cname.
                    c2 := c2 + 1.
                    conditions at: c2 put: op.
                    c2 := c2 + 1.


                ].

                (flag = 0)
                ifTrue: [
                    c2 := ((t1-1) * 3) + 1.
                    conditions at: c2 put: cname.
                    c2 := c2 + 1.
                    conditions at: c2 put: op.
                    c2 := c2 + 1.
                    conditions at: c2 put: val.

                    t1 := t1 + 1.
                ].
            ].

            (cond = 0)
            ifTrue: [
                |shape i sumArea sumVol area vol|
                sumArea := 0.
                sumVol := 0.
                i := 1.
                [i <= slist size]
                whileTrue: [
                    shape := (slist at: i).
                    area := shape getArea.
                    vol := shape getVolume.

                    sumArea := sumArea + area.
                    sumVol := sumVol + vol.

                    i := i + 1.
                ].
        
                ((slist size) < 1)
                ifTrue: [
                    'There are no shapes satisfying the condition(s)' displayNl.
                ]
                ifFalse: [
                    (act = 'total')
                    ifTrue: [
                        'total(Surface area)= ' display.
                        sumArea printNl.

                        'total(Volume)= ' display.
                        sumVol printNl.
                    ]
                    ifFalse: [
                        |meanA meanV size|
                        size := slist size.
                        meanA := sumArea / (size asFloatE).
                        meanV := sumArea / (size asFloatE).

                        'avg(Surface area)= ' display.
                        meanA printNl.

                        'avg(Volume)= ' display.
                        meanV printNl.

                    ].
                ].
                
            ]
            ifFalse: [
                |shape i sumArea sumVol area vol count|
                sumArea := 0 asFloatE.
                sumVol := 0 asFloatE.
                count := 0.
                i := 1.
                [i <= slist size]
                whileTrue: [
                    shape := (slist at: i).
                    area := shape getArea.
                    vol := shape getVolume.

                    (shape test: conditions)
                    ifTrue: [   
                        sumArea := sumArea + area.
                        sumVol := sumVol + vol.
                        count := count + 1.
                        
                    ].

                    i := i + 1.
                ].
                (count = 0)
                ifTrue: [
                    'There are no shapes satisfying the condition(s)' displayNl.
                ]
                ifFalse: [
                    (act = 'total')
                    ifTrue: [
                        'total(Surface area)= ' display.
                        sumArea printNl.

                        'total(Volume)= ' display.
                        sumVol printNl.
                    ]
                    ifFalse: [
                        |meanA meanV|
                        meanA := sumArea / (count asFloatE).
                        meanV := sumVol / (count asFloatE).

                        'avg(Surface area)= ' display.
                        meanA printNl.

                        'avg(Volume)= ' display.
                        meanV printNl.

                    ].
                    
                ].

            ].

        ].

    ].

    "command := ''.
    'Enter a command: ' display.
    command := stdin nextLine."
].