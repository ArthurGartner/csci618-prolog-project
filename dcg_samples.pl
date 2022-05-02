/*Taken from Review of DCGS from cs.union.edu - https://cs.union.edu/~striegnk/courses/nlp-with-prolog/html/node32.html#l5.sec.review */


/*Context free grammar*/
s --> np, vp.
np --> det, n.
vp --> v, np.
det --> [the].
det --> [a].
n --> [witch].
n --> [wizard].
v --> [curses].