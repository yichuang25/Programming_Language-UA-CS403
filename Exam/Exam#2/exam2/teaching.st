Physician subclass: Teaching [
    |base wRVU rate|

    init [
        base := 0.
        wRVU := 0.
        rate := 0.
        ^super init.
    ]

    setBase: b [
        base := b asFloatE.
    ]

    getBase [
        ^base.
    ]

    setwRVU: w [
        wRVU := w asFloatE.
    ]

    getwRVU [
        ^wRVU.
    ]

    setRate: r [
        rate := r.
    ]

    getRate [
        ^rate.
    ]

    getAnnual [
        |annual|
        annual := 0 asFloatE.
        annual := annual + base.
        (wRVU > 3000)
        ifTrue: [
            annual := annual + ((wRVU - 3000) * rate).
        ]
        ifFalse: [
            annual := annual + (0 asFloatE).
        ].

        (annual < 0)
        ifTrue: [
            annual := 0 asFloatE.
        ].
        ^annual.
    ]

    getInfo [
        |salary|
        first_name display.
        ' ' display.
        last_name display.
        ' (T) ' display.
        salary := self getAnnual.
        salary print.
        (salary > 400000)
        ifTrue: [
            ' High' displayNl.
        ]
        ifFalse: [
            (salary > 200000)
            ifTrue: [
                ' Mid' displayNl.
            ]
            ifFalse: [
                ' Low' displayNl.
            ].
        ].

    ]

]