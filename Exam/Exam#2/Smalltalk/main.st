(Smalltalk arguments size ~= 1)
ifTrue: [
    'Usage: physician.st teaching.st clinical.st -f main.st physician_file' displayNl.
    ^ObjectMemory quit.
].

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
[f atEnd] whileFalse: [
    ws nextPut: b.

    b := f nextLine.
].
ws nextPut: b.
f close.
"ws contents displayNl."

|plist i tset|
tset := Set new.
tset add: 'teaching'. tset add: 'clinical'.
plist := Array new: (ws size).
i := 1.
[i <= plist size]
whileTrue: [
    |t type fname lname|
    t := ws contents at: i.
    (t = nil)
    ifTrue: [
        'No people in the file' displayNl.
        ^ObjectMemory quit.
    ].
    t := (ws contents at: i) asString.
    t := t subStrings.
    type := t at: 1.
    fname := t at: 2.
    lname := t at: 3.
    (tset includes: type)
    ifFalse: [
        type display.
        ' not exit' displayNl.
    ]
    ifTrue: [
        (type = 'teaching')
        ifTrue: [
            |tc b w r|
            b := t at: 4.
            w := t at: 5.
            r := t at: 6.

            tc := Teaching new.
            tc set_first_name: fname.
            tc set_last_name: lname.
            tc setBase: b asNumber.
            tc setwRVU: w asNumber.
            tc setRate: r asNumber.

            plist at: i put: tc.
        ].
        (type = 'clinical')
        ifTrue: [
            |cn w r|
            w := t at: 4.
            r := t at: 5.

            cn := Clinical new.
            cn set_first_name: fname.
            cn set_last_name: lname.
            cn setwRVU: w asNumber.
            cn setRate: r asNumber.

            plist at: i put: cn.
        ].

    ].

    i := i+1.
].

|phy|
i := 1.
[i <= plist size]
whileTrue: [
    phy := (plist at: i).
    phy getInfo.

    i := i + 1.
].