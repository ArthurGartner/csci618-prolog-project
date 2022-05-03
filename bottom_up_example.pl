/* Taken from NLP with prolog from https://cs.union.edu/~striegnk/courses/nlp-with-prolog/html/node94.html#l14.sec.topdown */
/* ?- op(255,xfx,--->). required */
/*lex(robber,N) :- N = [cat:n,num:sg|_].
lex(him,N) :- N = [cat:pro,num:sg,case:acc|_].*/

s     ---> [np,vp].
np    ---> [pn].
np    ---> [pn,rel].
np    ---> [det, nbar].
nbar  ---> [n].
nbar  ---> [n,rel].
rel   ---> [wh,vp].
vp    ---> [iv].
vp    ---> [tv,np].
vp    ---> [dv,np,pp].
vp    ---> [sv,s].
pp    ---> [p,np].

lex(vincent,pn).
lex(mia,pn).
lex(marsellus,pn).
lex(jules,pn).
lex(a,det).
lex(the,det).
lex(her,det).
lex(his,det).
lex(gun,n).
lex(robber,n).
lex(man,n).
lex(woman,n).
lex(who,wh).
lex(that,wh).
lex(to,p).
lex(died,iv).
lex(fell,iv).
lex(loved,tv).
lex(shot,tv).
lex(knew,tv).
lex(gave,dv).
lex(handed,dv).
lex(knew,sv).
lex(believed,sv).

recognize_bottomup([s]).
         
recognize_bottomup(String) :-
        split(String,Front,Middle,Back),
        ( Cat ---> Middle  
         ;
          (Middle = [Word], lex(Word,Cat))
        ),
        append(Front,[Cat|Back],NewString),
        recognize_bottomup(NewString).

split(ABC, A, B, C) :-
        append(A, BC, ABC),
        append(B, C, BC).