demonslayer(kagaya).
demonslayer(amane).
demonslayer(hinaki).
demonslayer(nichika).
demonslayer(kiriya).
demonslayer(kanata).
demonslayer(giyu).
demonslayer(mitsuri).
demonslayer(obanai).
demonslayer(sanemi).
demonslayer(gyomei).
demonslayer(muichiro).
demonslayer(shinobu).
demonslayer(kanae).
demonslayer(sakonji).
demonslayer(jigoro).
demonslayer(kyojuro).
demonslayer(shinjuro).
demonslayer(tengen).
demonslayer(kanao).
demonslayer(tanjiro).
demonslayer(zenitsu).
demonslayer(inosuke).
demonslayer(genya).
demonslayer(murata).
demonslayer(ozaki).
demonslayer(aoi).
demonslayer(sumi).
demonslayer(kiyo).
demonslayer(naho).

dead(kagaya).
dead(amane).
dead(hinaki).
dead(nichika).
dead(mitsuri).
dead(obanai).
dead(gyomei).
dead(muichiro).
dead(shinobu).
dead(kyojuro).
dead(genya).

alive(kiriya).
alive(kanata).
alive(giyu).
alive(sanemi).
alive(kanae).
alive(sakonji).
alive(jigoro).
alive(shinjuro).
alive(tengen).
alive(kanao).
alive(tanjiro).
alive(zenitsu).
alive(inosuke).
alive(murata).
alive(ozaki).
alive(aoi).
alive(sumi).
alive(kiyo).
alive(naho).

%list_teacher
isteacher(kagaya).
isteacher(zenitsu).
isteacher(shinjuro).
isteacher(sakonji).
isteacher(sanemi).
isteacher(aoi).

%teacher_a_of_B
teacher(kagaya,amane).
teacher(kagaya,hinaki).
teacher(kagaya,nichika).
teacher(kagaya,kiriya).
teacher(kagaya,kanata).
teacher(zenitsu,gyomei).
teacher(shinjuro,kyojuro).
teacher(sakonji,kanao).
teacher(sakonji,tanjiro).
teacher(sakonji,zenitsu).
teacher(sakonji,inosuke).
teacher(sanemi,genya).
teacher(aoi,sumi).
teacher(aoi,kiyo).
teacher(aoi,naho).

%rank
rank(kagaya,1).
rank(kanae,1).
rank(jigoro,1).
rank(kyojuro,1).
rank(shinjuro,1).
rank(sakonji,1).
rank(mitsuri,2).
rank(obanai,2).
rank(sanemi,2).
rank(gyomei,2).
rank(muichiro,2).
rank(shinobu,2).
rank(tengen,3).
rank(genya,3).
rank(amane,4).
rank(hinaki,4).
rank(nichika,4).
rank(kiriya,4).
rank(kanata,4).
rank(kanao,4).
rank(tanjiro,4).
rank(zenitsu,4).
rank(inosuke,4).
rank(aoi,4).
rank(murata,5).
rank(ozaki,5).
rank(sumi,6).
rank(kiyo,6).
rank(naho,6).

%style
style(giyu,water).
style(mitsuri,love).
style(obanai,serpant).
style(sanemi,wind).
style(gyomei,stone).
style(muichiro,mist).
style(shinobu,insect).
style(kanae,flower).
style(sakonji,water).
style(jigoro,thunder).
style(kyojuro,flame).
style(shinjuro,flame).
style(tengen,sound).
style(kanao,flower).
style(tanjiro,sun).
style(tanjiro,water).
style(zenitsu,thunder).
style(inosuke,beast).
style(murata,water).

%style_weak_strong
brank(sun,1).
brank(water,2).
brank(moon,2).
brank(falme,2).
brank(thunder,2).
brank(ston,2).
brank(wind,2).
brank(flower,3).
brank(serpant,3).
brank(love,3).
brank(sound,3).
brank(beast,3).
brank(mist,3).
brank(insect,4).

%sense_ability
sense(zenitsu, hearing).
sense(gyomei, hearing).
sense(tengen, hearing).
sense(tanjiro, smell).
sense(sakonji, smell).
sense(inosuke, touch).
sense(kanao, sight).
sense(genya, sight).

%rule
find_max([R], R).
find_max([X|Xs], R):- find_max(Xs, T), (X > T -> R = X ; R = T). %find_max_from_list
find_min([R], R).
find_min([X|Xs], R):- find_min(Xs, T), (X < T -> R = X ; R = T). %find_min_from_list

list_min(L, Max) :- select(Max, L, Rest), \+ (member(E, Rest), E < Max).
list_max_rank_in_teacher(X,Y) :- rank_stud_in_teacher(X,A), findall(B,list_min(A,B), Y). %list_of_max_rank_in_teacher
highest_rank(X,Y) :- rank_stud_in_teacher(X,A), find_min(A,Y). %find_max_num
lowest_rank(X,Y) :- rank_stud_in_teacher(X,A), find_max(A,Y). %find_min_num
count([],0).
count([_|A],B) :- count(A,C), B is C + 1. %count_function
max_list(X,Y) :- list_max_rank_in_teacher(X,A), count(A,Y). %number_of_max_rank
list_stu(X,Y) :- findall(A, (teacher(X,A)), Y). %find_all_stundent_in_teacher
rank_stud_in_teacher(X,Y) :- findall(B, (teacher(X,A), rank(A,B)), Y). %list_of_rank_in_that_teacher

element_count(X,N,L) :- aggregate(count,member(X,L),N). %count_element_in_list
max_element_count(X,N,L) :- aggregate(max(N1,X1),element_count(X1,N1,L),max(N,X)). %find_max_element_list

swap(P, X, Y) :-  permutation([X,Y], [X1,Y1]), call(P, Y1, X1).
opposite(X, Y) :- swap(teacher, X, Y).

student_of(X,Y) :- isteacher(Y), teacher(Y,A), X==A. 
same_teacher(X,Y) :- isteacher(Z), teacher(Z,X), teacher(Z,Y), X\=Y.
same_teacher_style(X,Y) :- teacher(X,Z), style(Z,Y).
same_teacher_sense(X,Y) :- teacher(X,Z), sense(Z,Y).
higher_rank(X,Y) :- rank(X,A), rank(Y,B), A>B.
lower_rank(X,Y) :- rank(X,A), rank(Y,B), A<B.
same_teacher_higher(X,Y) :- higher_rank(X,A), student_of(A,Y).
same_style_higher(X,Y) :- demonslayer(Y), higher_rank(X,Y), style(X,Z), style(Y,C), Z==C. 
same_sense_higher(X,Y) :- demonslayer(Y), higher_rank(X,Y), sense(X,Z), sense(Y,C), Z==C.
most_rank_in_teacher(X,Y) :- lowest_rank(X,A), rank(Y,A), teacher(X,Y).
who_have_stud_lower_rank(X,Y) :- isteacher(X), isteacher(Y), highest_rank(X,A), highest_rank(Y,B), A<B.
same_sense_style(X,Y) :- demonslayer(A), sense(A,B), B==X, style(A,Y).
same_style_sense(X,Y) :- demonslayer(A), style(A,B), X==B, sense(A,Y).
teacher_who_have_higher_stu_rank(X,Y) :- isteacher(X), isteacher(Y), highest_rank(X,A), highest_rank(Y,B), A>B.
teacher_who_have_higher_stu_rank(X,Y) :- isteacher(X), isteacher(Y), highest_rank(X,A), highest_rank(Y,B), A==B, max_list(X,C), max_list(Y,D), D>C.
find_the_most_sense_from_same_teacher(X,Y) :- findall(A, same_teacher_sense(X,A), C), max_element_count(Y,N,C).
find_the_most_style_from_same_teacher(X,Y) :- findall(A, same_teacher_style(X,A), C), max_element_count(Y,N,C).
find_which_teacher_that_have_student_higher_rank(X,Y) :- higher_rank(X,A), teacher(Y,A).
what_sense_of_teacher_who_have_stud_higher_rank(X,Y) :- isteacher(X), who_have_stud_higher_rank(X,A), teacher(A,B), sense(B,Y).
what_sense_of_teacher_who_have_stud_lower_rank(X,Y) :- isteacher(X), who_have_stud_lower_rank(X,A), teacher(A,B), sense(B,Y).
strongest_style_in_that_teacher(X,Y) :- findall(A, teacher(X,A), B), findall(D, (member(C,B),style(C,D)), E), findall(F, (member(G,E), brank(G,F)), H), find_min(H,M), brank(Y,K), K==M.
