Account subclass: Savings [
    | interest |

    init [
        <category: 'initialization'>
        interest := 0.
        ^super init
    ]

    interest: amount [
        interest := interest + amount.
        self deposit: amount
    ]

    clearInterest [
        | oldinterest |
        oldinterest := interest.
        interest := 0.
        ^oldinterest
    ]
]
