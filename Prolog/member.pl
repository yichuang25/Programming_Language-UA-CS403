member2(Element, [Element | _]).
member2(Element, [_ | List]) :-
                       member2(Element, List).

% member2(a, [a, b, c]).
% member2(d, [a, b, c]).
