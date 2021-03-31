Shape subclass: Cylinder [
    | radius height |
    
    init [
        radius := 0.
        height := 0.
        ^super init.
    ]

    setradius: rad [
        radius := rad asFloatE.
    ]

    getradius [
        ^radius.
    ]

    setheight: h [
        height := h asFloatE.
    ]

    getheight [
        ^height.
    ]

    getArea [ "2*pi*r*(r+h)"
        ^(radius+height)*radius*FloatE pi* 2.0 asFloatE.
    ]

    getVolume [ "PI*r*r*h"
        ^FloatE pi*radius*radius*height.
    ]

    getInfo [
        'Cylinder: ' display.
        name display.
        ', Radius=' display.
        radius print.
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
                type := 'cylinder'.
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