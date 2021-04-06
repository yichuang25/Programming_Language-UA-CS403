reverse2([], []).
reverse2([Head | Tail], List) :- 
  reverse2(Tail, Result),  
           append(Result, [Head], List).

% reverse2([a,b,c], Q).
