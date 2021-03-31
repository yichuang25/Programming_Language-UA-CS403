Object subclass: Shape [
    | name |
    <comment: 'root class Shape'>

    Shape class >> new [
        <catagory: 'Instance creation'>
        |r|
        r := super new.
        r init.
        ^r
    ]


    init[
        name := ''.
    ]

    printOn: stream [
        super printOn: stream.
        stream nextPutAll: ' with name: '.
        name printOn: stream
    ]

    setname: namestring [
        name := namestring.
    ]

    getname [
        | c |
        c := name.
        ^c
    ]
    

]