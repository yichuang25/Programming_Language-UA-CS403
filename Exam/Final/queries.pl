list(Lower,Upper,List) :- findall([X, Y], (charge(X, Y, Z), Z >= Lower, Z =< Upper), List).

count(Lower,Upper,Count) :- findall(Z, (charge(X, Y, Z), Z >= Lower, Z =< Upper), List),  length(List, Count).