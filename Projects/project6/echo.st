|command|
command := ''.
[command ~= 'quit']
whileTrue: [
    |c1|
    'Enter a command: ' display.
    command := stdin nextLine.
    command displayNl.
    c1 := ''.
    c1 := stdin nextLine.
    c1 displayNl.
].