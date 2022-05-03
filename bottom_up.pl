/* Need to run ?- op(255,xfx,--->). before compile */
/* Bottom up example */
/*Phrase structure representation of grammar structure from top_down.pl*/ 
re ---> [aw,vs].
vs ---> [state_verb,noun_item].
vs ---> [sv,noun_item,snc].
aw ---> [svc,sva].
aw ---> [gvc,gva].
np ---> [det,sn].
noun_item ---> [sn].
noun_item ---> [np].
v ---> [sv].
state_verb ---> [pv].
pv ---> [action, status].
val ---> [integer, metric].
val_temp ---> [integer, metric_temp].
snc ---> [desc_noun, prep, val].
snc ---> [desc_noun].
snc ---> [desc_noun, prep, val].
snc ---> [desc_noun].
snc ---> [desc_noun, prep, val].

/*lexical rules are paired with grammar*/
lex(alexa,aw).
lex(hey,svc).
lex(ok, gvc).
lex(hey,wws).
lex(ok,wwg).
lex(siri,sva).
lex(gva,google).
lex(the,det).
lex(light,sn).
lex(thermostat, sn).
lex(tv,sn).
lex(brightness,desc_noun).
lex(is, av).
lex(increase, sv).
lex(decrease, sv).
lex(set, sv).
lex(to, prep).
lex(by, prep).
lex(on, status).
lex(off, status).
lex(turn, action).
lex(50, integer).
lex(percent, metric).
lex(farenheight, metric_temp).
lex(temperature, desc_noun).
lex(volume, desc_noun).

/*Ends when string is found */
post_order_traverse([re]).

/* Recursive approach that goes through string. Credit - cd.union.edu*/
post_order_traverse(String) :-
        split(String,Front,Middle,Back),
        ( Cat ---> Middle  
         ;
          (Middle = [Word], lex(Word,Cat))
        ),
        append(Front,[Cat|Back],NewString),
        post_order_traverse(NewString).

/*Method that splits string into 3 parts. Credit - cd.union.edu*/
split(ABC, A, B, C) :-
        append(A, BC, ABC),
        append(B, C, BC).



