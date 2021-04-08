pay(F,L,P) :- salaried(F, L, Salary),
        P is Salary.

pay(F,L,P) :- commission(F,L,Min,Sales,Crate),
        Sales*Crate > Min,
        P is Sales*Crate.

pay(F,L,P) :- commission(F,L,Min,Sales,Crate),
        Sales*Crate =< Min,
        P is Min.

pay(F,L,P) :- hourly(F,L,Hours,Rate),
        40 >= Hours,
        P is Hours*Rate.

pay(F,L,P) :- hourly(F,L,Hours,Rate),
        40 < Hours,
        50 >= Hours,
        P is (40*Rate + (Hours - 40)*Rate*1.5).

pay(F,L,P) :- hourly(F,L,Hours,Rate),
        50 < Hours,
        P is (40*Rate + 10*1.5*Rate + (Hours - 50)*Rate*2).