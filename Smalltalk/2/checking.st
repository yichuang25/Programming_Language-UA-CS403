Account subclass: Checking [
    | checknum checksleft history |

    init [
        <category: 'initialization'>
        checksleft := 0.
        history := Dictionary new.
        ^ super init
    ]

    newChecks: number count: checkcount [
        <category: 'spending'>
        checknum := number.
        checksleft := checkcount
    ]

    writeCheck: amount [
        <category: 'spending'>
        | num |

        "Sanity check that we have checks left in our checkbook"
        (checksleft < 1)
            ifTrue: [ ^self error: 'Out of checks' ].

        "Make sure we've never used this check number before"
        num := checknum.
        (history includesKey: num)
            ifTrue: [ ^self error: 'Duplicate check number' ].

        "Record the check number and amount"
        history at: num put: amount.

        "Update our next checknumber, checks left, and balance"
        checknum := checknum + 1.
        checksleft := checksleft - 1.
        self spend: amount.
        ^ num
    ]

    printOn: stream [
        super printOn: stream.
        ', checks left: ' displayOn: stream.
        checksleft printOn: stream.
        ', checks written: ' displayOn: stream.
        (history size) printOn: stream.
    ]

    check: num [
        | c |
        c := history
            at: num
            ifAbsent: [ ^self error: 'No such check #' ].
        ^c
    ]

    printChecks [
        history keysAndValuesDo: [ :key :value |
            key print.
            ' - ' display.
            value printNl.
        ]
    ]

    checksOver: amount do: aBlock [
        history keysAndValuesDo: [:key :value |
            (value > amount)
                   ifTrue: [aBlock value: key]
        ]
    ]
]
