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

%rule
find_max([R], R).
find_max([X|Xs], R):- find_max(Xs, T), (X > T -> R = X ; R = T). %find_max_from_list
find_min([R], R).
find_min([X|Xs], R):- find_min(Xs, T), (X < T -> R = X ; R = T). %find_max_from_list
highest_rank(X,Y) :- rank_stud_in_teacher(X,A), find_min(A,Y). %find_max_num
lowest_rank(X,Y) :- rank_stud_in_teacher(X,A), find_max(A,Y). %find_min_num
list_stu(X,Y) :- findall(A, (teacher(X,A)), Y). %find_all_stundent_in_teacher
rank_stud_in_teacher(X,Y) :- findall(B, (teacher(X,A), rank(A,B)), Y). %list_of_rank_in_that_teacher


same_teacher_style(X,Y) :- demonslayer(X), demonslayer(Y), teacher(X,Z), style(Z,Y).
higher_rank(X,Y) :- demonslayer(X), demonslayer(Y), X\=Y, rank(X,A), rank(Y,B), A>B.
same_teacher_higher(X,Y,Z) :- demonslayer(X), demonslayer(Y), demonslayer(Z), teacher(X,Y), teacher(X,Z), higherrank(Y,Z).
