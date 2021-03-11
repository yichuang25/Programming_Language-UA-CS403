mycheck := Checking new.
mycheck deposit: 250.
mycheck newChecks: 100 count: 40.
mycheck writeCheck: 10. 
mycheck writeCheck: 52. 
mycheck writeCheck: 15. 
mycheck printChecks.
(mycheck check: 101) printNl. 
mycheck checksOver: 1 do: [:x | x printNl].
mycheck checksOver: 17 do: [:x | x printNl]. 
mycheck checksOver: 200 do: [:x | x printNl].
