list(Op, Ref, List) :- (                
    Op=('=='), findall([X, Y, Z], (pay(X, Y, Z), Z=:=Ref), List);    
    Op=('!='), findall([X, Y, Z], (pay(X, Y, Z), Z=\=Ref), List);    
    Op=('>'), findall([X, Y, Z], (pay(X, Y, Z), Z>Ref), List);    
    Op=('>='), findall([X, Y, Z], (pay(X, Y, Z), Z>=Ref), List);    
    Op=('<'), findall([X, Y, Z], (pay(X, Y, Z), Z<Ref), List);    
    Op=('<='), findall([X, Y, Z], (pay(X, Y, Z), Z=<Ref), List)               
).

count(Op, Ref, Count) :- (                
    Op=('=='), findall(Z, (pay(X, Y, Z), Z=:=Ref), List),  length(List, Count);                
    Op=('!='), findall(Z, (pay(X, Y, Z), Z=\=Ref), List),  length(List, Count);                
    Op=('>'), findall(Z, (pay(X, Y, Z), Z>Ref), List),  length(List, Count);                
    Op=('>='), findall(Z, (pay(X, Y, Z), Z>=Ref), List),  length(List, Count);                
    Op=('<'), findall(Z, (pay(X, Y, Z), Z<Ref), List),  length(List, Count);                
    Op=('<='), findall(Z, (pay(X, Y, Z), Z=<Ref), List),  length(List, Count)                
).

min(Op, Ref, Min) :- (                
    Op=('=='), findall(Z, (pay(X, Y, Z), Z=:=Ref), List),  min_list(List, Min);                
    Op=('!='), findall(Z, (pay(X, Y, Z), Z=\=Ref), List),  min_list(List, Min);                
    Op=('>'), findall(Z, (pay(X, Y, Z), Z>Ref), List),  min_list(List, Min);                
    Op=('>='), findall(Z, (pay(X, Y, Z), Z>=Ref), List),  min_list(List, Min);                
    Op=('<'), findall(Z, (pay(X, Y, Z), Z<Ref), List),  min_list(List, Min);                
    Op=('<='), findall(Z, (pay(X, Y, Z), Z=<Ref), List),  min_list(List, Min)                
).

max(Op, Ref, Max) :- (                
    Op=('=='), findall(Z, (pay(X, Y, Z), Z=:=Ref), List),  max_list(List, Max);                
    Op=('!='), findall(Z, (pay(X, Y, Z), Z=\=Ref), List),  max_list(List, Max);                
    Op=('>'), findall(Z, (pay(X, Y, Z), Z>Ref), List),  max_list(List, Max);                
    Op=('>='), findall(Z, (pay(X, Y, Z), Z>=Ref), List),  max_list(List, Max);                
    Op=('<'), findall(Z, (pay(X, Y, Z), Z<Ref), List),  max_list(List, Max);                
    Op=('<='), findall(Z, (pay(X, Y, Z), Z=<Ref), List),  max_list(List, Max)                
).

total(Op, Ref, Total) :- (                
    Op=('=='), findall(Z, (pay(X, Y, Z), Z=:=Ref), List),  sum_list(List, Total);                
    Op=('!='), findall(Z, (pay(X, Y, Z), Z=\=Ref), List),  sum_list(List, Total);                
    Op=('>'), findall(Z, (pay(X, Y, Z), Z>Ref), List),  sum_list(List, Total);                
    Op=('>='), findall(Z, (pay(X, Y, Z), Z>=Ref), List),  sum_list(List, Total);                
    Op=('<'), findall(Z, (pay(X, Y, Z), Z<Ref), List),  sum_list(List, Total);                
    Op=('<='), findall(Z, (pay(X, Y, Z), Z=<Ref), List),  sum_list(List, Total)                
).

avg(Op, Ref, Avg) :- (                
    Op=('=='), findall(Z, (pay(X, Y, Z), Z=:=Ref), List),  sum_list(List, Sum), length(List, Count), Avg is Sum/Count;                
    Op=('!='), findall(Z, (pay(X, Y, Z), Z=\=Ref), List),  sum_list(List, Sum), length(List, Count), Avg is Sum/Count;                
    Op=('>'), findall(Z, (pay(X, Y, Z), Z>Ref), List),  sum_list(List, Sum), length(List, Count), Avg is Sum/Count;                
    Op=('>='), findall(Z, (pay(X, Y, Z), Z>=Ref), List),  sum_list(List, Sum), length(List, Count), Avg is Sum/Count;                
    Op=('<'), findall(Z, (pay(X, Y, Z), Z<Ref), List),  sum_list(List, Sum), length(List, Count), Avg is Sum/Count;                
    Op=('<='), findall(Z, (pay(X, Y, Z), Z=<Ref), List),  sum_list(List, Sum), length(List, Count), Avg is Sum/Count                
).