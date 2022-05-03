/* Project demo mimicking voice assistants. */
/* This demonstrates top down string parsing */
/*Context free grammar structure*/
/* re = request to voice assitant. Consists of wake word and valid sentence */
re --> aw, vs.
/* vs = a valid sentence is either a command.*/
/*Imperative sentences*/
/* Can contain phrasal verbs */
vs --> state_verb, noun_item.
vs --> sv, noun_item, snc.

/*Assistant wake words and phrases*/
aw --> [alexa].
aw --> [hey], sva.
aw --> [ok], gva.
wws --> [hey].
wwg --> [ok].
sva --> [siri].
gva --> [google].

np --> det, sn.
det --> [the].

noun_item --> sn.
noun_item --> np.

/* items */
sn --> [light].
sn --> [thermostat].
sn --> [tv].

/* characteristics */
snc --> [brightness].
snc --> [brightness], prep, val.
snc --> [temperature].
snc --> [temperature], prep, val.
snc --> [temperature], prep, val_temp.
snc --> [volume].
snc --> [volume], prep, val.

av --> [is].

v --> sv.
sv --> [increase].
sv --> [decrease].
sv --> [set].

prep --> [to].
prep --> [by].

state_verb --> pv.
pv --> [turn], status.
status --> [on].
status --> [off].

val --> [50], metric.
val_temp --> [50], metric_temp.

metric --> [percent].
metric_temp --> [farenheight].

/* Attemped interactive demo, does not work */
begin_demo :-
    write("Type in an input"),
    read(Command),
    split_string(Command, " ", "", L),
    write(L),
    re(Command, []).

