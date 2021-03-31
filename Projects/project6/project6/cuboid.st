Shape subclass: Cuboid [
    | length width height |
    
    init [
        length := 0.
        width := 0.
        height := 0.
        ^super init.
    ]

    setlength: l [
        length := l asFloatE.
    ]

    getlength [
        ^length.
    ]

    setwidth: w [
        width := w asFloatE.
    ]

    getwidth [
        ^width.
    ]

    setheight: h [
        height := h asFloatE.
    ]

    getheight [
        ^height.
    ]

    getArea [ 
        ^(2 asFloatE*width*length) + (2 asFloatE*height*length) + (2 asFloatE*width*height).
    ]

    getVolume [ 
        ^length*height*width.
    ]

    getInfo [
        'Cuboid: ' display.
        name display.
        ', Length=' display.
        length print.
        ', Width=' display.
        width print.
        ', Height=' display.
        height printNl.
        '        Surface area: ' display.
        self getArea print.
        ', Volume: ' display.
        self getVolume printNl.
    ]

    test: cond [
        |index size|
        index := 1.
        size := cond size.
        [index <= size]
        whileTrue: [
            | name op value|
            name := (cond at: index).
            index := index + 1.
            op := (cond at: index).
            index := index + 1.
            value := (cond at: index).

            (name = 'type')
            ifTrue: [
                | type |
                type := 'cuboid'.
                (op = '==')
                ifTrue: [
                    (type ~= value)
                    ifTrue: [
                        ^ false.
                    ].
                ].
                (op = '!=')
                ifTrue: [
                    (type = value)
                    ifTrue: [
                        ^ false.
                    ].
                ].
                (op = '>=')
                ifTrue: [
                    (type < value)
                    ifTrue: [
                        ^false.
                    ].
                ].
                (op = '<=')
                ifTrue: [
                    (type > value)
                    ifTrue: [
                        ^false.
                    ].
                ].
                (op = '>')
                ifTrue: [
                    (type <= value)
                    ifTrue: [
                        ^false.
                    ].
                ].
                (op = '<')
                ifTrue: [
                    (type >= value)
                    ifTrue: [
                        ^false.
                    ].
                ].
            ].
            (name = 'area')
            ifTrue: [
                | a b |
                a := self getArea.
                b := value asNumber asFloatE.
            
               (op = '==')
               ifTrue: [
                   (a ~= b)
                   ifTrue: [
                       ^false.
                   ].
               ].
               (op = '!=')
               ifTrue: [
                   (a = b)
                   ifTrue: [
                       ^false.
                   ].

               ].
               (op = '>=')
               ifTrue: [
                   (a < b)
                   ifTrue: [
                       ^false.
                   ].
               ].
               (op = '<=')
               ifTrue: [
                   (a > b)
                   ifTrue: [
                       ^false.
                   ].
               ].
               (op = '>')
               ifTrue: [
                   (a <= b)
                   ifTrue: [
                       ^false.
                   ].
               ].
               (op = '<')
               ifTrue: [
                   (a >= b)
                   ifTrue: [
                       ^false.
                   ].
               ].

            ].
            (name = 'volume')
                ifTrue: [
                    | v vn |
                    v := self getVolume.
                    vn := value asNumber asFloatE.

                    (op = '==')
                    ifTrue: [
                        (v ~= vn)
                        ifTrue: [
                            ^false.
                        ].
                    ].
                    (op = '!=')
                    ifTrue: [
                        (v = vn)
                        ifTrue: [
                            ^false.
                        ].

                    ].
                    (op = '>=')
                    ifTrue: [
                        (v < vn)
                        ifTrue: [
                            ^false.
                        ].
                    ].
                    (op = '<=')
                    ifTrue: [
                        (v > vn)
                        ifTrue: [
                            ^false.
                        ].
                    ].
                    (op = '>')
                    ifTrue: [
                        (v <= vn)
                        ifTrue: [
                            ^false.
                        ].
                    ].
                    (op = '<')
                    ifTrue: [
                        (v >= vn)
                        ifTrue: [
                            ^false.
                        ].
                    ].
                ].
            index := index + 1.
        ].
        
        ^ true.
    ]
]