/* IGNORE FOR PROJECT, this was only a tutorial done to understand the syntax of Prolog!
Followed from https://www.youtube.com/watch?v=SykxWpFwMGs 
-Helped with understanding of Prolog language*/

/* This is a fact. Loves is predicate, romeo and juliet are atoms or constants.*/
loves(romeo, juliet).

/*if, this is a rule*/
loves(juliet, romeo) :- loves(romeo, juliet).

/* variables start with capital letters ?- loves(romeo, X). => X = juliet */

male(albert).
male(bob).
male(bill).
male(carl).
male(charlie).
male(dan).
male(edward).

female(alice).
female(betsy).
female(diana).

/* ?- female(alice). => true; ?- listing(male). => ALL MALES LISTED; ?- male(X), female(Y). => LISTS ALL COMBINATIONS, USE ';' TO CYCLE THROUGH */

happy(albert).
happy(alice).
happy(bob).
happy(bill).
with_albert(alice).

runs(albert) :- 
    happy(albert).

dances(alice) :- 
    happy(alice),
    with_albert(alice).

does_alice_dance :- dances(alice),
    write('When Alice is happy and with Albert she dances').

swims(bill) :-
    happy(bill).

swims(bill) :-
    near_water(bill).

parent(albert, bob).
parent(albert, betsy).
parent(albert, bill).

parent(alice, bob).
parent(alice, betsy).
parent(alice, bill).

parent(bob, carl).
parent(bob, charlie).

get_grandchild :- 
    parent(albert, X),
    parent(X, Y),
    write('Alberts grandchild is '),
    write(Y), nl.

get_grandparent :-
parent(X, carl),
parent(X, charlie),
format('~w ~s grandparent ~n', [X, "is the"]).


/* query = parent(X, carl), brother(X, Y) */

brother(bob, bill).

/* query = grand_parent(carl, A) */
grand_parent(X, Y) :-
    parent(Z, X),
    parent(Y, Z).

blushes(X) :- human(X).

human(derek).

stabs(tybalt, mercutio, sword).
hates(romeo, X) :- stabs(X, mercutio, sword).


what_grade(5) :-
    write('Go to kindergartnen').

what_grade(6) :-
    write('Go to 1st Grade').

what_grade(Other) :-
    Grade is Other - 5,
    format('Go to grade ~w', [Grade]).

/* Structures */
/* ?- owns(albert, pet(cat, X)). */
owns(albert, pet(cat, olive)).

/* ?- customer(sally, _, Bal). */
customer(tom, smith, 20.55).
customer(sally, smith, 120.55).

get_cust_bal(FName, LName) :-
    customer(FName, LName, Bal),
    write(FName), tab(1),
    format('~w owes us $~2f ~n', [LName, Bal]).

/* vertical(line(point(20, 5), point(20, 6))). */
/* ?- vertical(line(points(5, 10), X)). */
vertical(line(point(X, Y), point(X, Y2))).

horizontal(line(point(X, Y), point(X2, Y))).

/* ---Value comparison--- */
/* \+ means not equal */
/* ?- rich(money, X) = rich(Y, no_debt). */

warm_blooded(penguin).
warm_blooded(human).

produce_milk(penguin).
produce_milk(human).

have_feathers(penguin).
have_hair(human).

mammal(X) :-
    warm_blooded(X),
    produce_milk(X),
    have_hair(X).

/* use trace for debugging */


related(X, Y) :-
    parent(X, Y).

/* recursion */
related(X, Y) :- 
    parent(X, Z),
    related(Z, Y). 

/* ?- double_digit(2, Y) */
double_digit(X, Y) :-
    Y is X*2.

is_even(X) :-
    Y is X//2, X =:= 2 * Y.

/* writeq('test')*/
say_hi :-
    write('What is your name? '),
    read(X),
    write('Hi '),
    write(X).

fav_char :-
    write('What is your fav character? '),
    get(X),
    format('The Ascii value ~w is ', [X]),
    put(X), nl.


/* ?- write_to_file('test1.txt', 'Random string'). */
write_to_file(File, Text) :-
    open(File, write, Stream),
    write(Stream, Text), nl,
    close(Stream).

read_file(File) :-
    open(File, read, Stream),
    get_char(Stream, Char1),
    process_stream(Char1, Stream),
    close(Stream).

process_stream(end_of_file, _) :- !.

process_stream(Char, Stream) :-
    write(Char),
    get_char(Stream, Char2),
    process_stream(Char2, Stream).

/* Looping */
count_to_10(10) :- write(10), nl.

count_to_10(X) :-
    write(X), nl,
    Y is X + 1,
    count_to_10(Y).

count_down(Low, High) :-
    between(Low, High, Y),
    Z is High - Y,
    write(Z), nl.

count_up(Low, High) :-
    between(Low, High, Y),
    Z is Y + Low,
    write(Z), nl.


/* Guessing game */
guess_num :- loop(start).

loop(15) :- write("You guessed it").

loop(X) :-
    X \= 15,
    write('Guess Number '),
    read(Guess),
    write(Guess),
    write(' is not the number'), nl,
    loop(Guess).

