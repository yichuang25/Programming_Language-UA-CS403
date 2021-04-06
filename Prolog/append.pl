append2([], List, List).
append2([Head | List_1], List_2, [Head | List_3]) :-
	append2(List_1, List_2, List_3).

% append2([a,b], [c,d,e], Q).
