Object subclass: Physician [
    |first_name last_name|

    Physician class >> new [
        |r|
        r := super new.
        r init.
        ^r
    ]

    init[
        first_name := ' '.
        last_name := ' '.
    ]

    printOn: stream [
        super printOn: stream.
        stream nextPutAll: ' with name: '.
        first_name printOn: stream
    ]

    set_first_name: fnamestring [
        first_name := fnamestring.
    ]

    get_first_name [
        | c |
        c := first_name.
        ^c
    ]

    set_last_name: lnamestring [
        last_name := lnamestring.
    ]

    get_last_name [
        |c|
        c := last_name.
        ^c
    ]


]