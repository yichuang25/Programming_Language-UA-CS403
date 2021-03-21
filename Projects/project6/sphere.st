Shape subclass: Sphere [
    | radius |

    init [
    radius := 0.
    ^super init
    ]

    setradius: rad [
        radius := rad asFloatE.
    ]

    getradius [
        ^radius.
    ]

    getArea [
        ^(radius * radius * 4.0 asFloatE * FloatE pi).
    ]

    getVolume [
        ^(4/3) asFloatE * FloatE pi * radius * radius * radius.
    ]

    getInfo [
        'Sphere: ' display.
        name display.
        ', Radius=' display.
        radius printNl.
        '        Surface area: ' display.
        self getArea print.
        ', Volume: ' display.
        self getVolume printNl.
    ]

    test: cond [
        |index size|
        index := 1.
        size := cond size.
        size printNl.
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
                type := 'sphere'.
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
                    v printNl.
                    vn := value asNumber asFloatE.
                    vn printNl.

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