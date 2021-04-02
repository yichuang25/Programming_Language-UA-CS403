Physician subclass: Clinical [
    |wRVU rate|

    init [
        wRVU := 0.
        rate := 0.
        ^super init.
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

        (wRVU > 5000)
        ifTrue: [
            |base rest|
            base := (5000 asFloatE) * rate.
            rest := ((wRVU - (5000 asFloatE)) * (1.1 asFloatE) * rate).
            annual := base + rest.
            "annual := annual + ((mRVU - (5000 asFloatE)) * (1.1 asFloatE) * rate)."
        ]
        ifFalse: [
            annual := wRVU * rate.
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
        ' (C) ' display.
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