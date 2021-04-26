charge(First,Last,Charge) :- subscriber(First,Last,Plan,Usage),
    Plan == 'basic',
    Charge is 10 + (Usage*5).

charge(First,Last,Charge) :- subscriber(First,Last,Plan,Usage),
    Plan == 'value',
    Usage =< 5,
    Charge is 25.

charge(First,Last,Charge) :- subscriber(First,Last,Plan,Usage),
    Plan == 'value',
    Usage > 5,
    Charge is (Usage - 5)*3 + 25.

charge(First,Last,Charge) :- subscriber(First,Last,Plan,Usage),
    Plan == 'unlimited',
    Charge is 40.