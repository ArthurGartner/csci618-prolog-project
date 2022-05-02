/* Project demo mimicking voice assistants. */
equals(temperature, 30).
equals(brightness, 50).
equals(volume, 50).
equals(light, off).
equals(thermostat, on).
equals(tv, off).

/*Context free grammar structure*/
/* re = request to voice assitant. Consists of wake word and valid sentence */
re --> aw, vs.
/* vs = a valid sentence is either a command or question.*/
/*Imperative sentences*/
/* Can contain phrasal verbs */
vs --> state_verb, noun_item.
vs --> sv, noun_item, snc.
/* Question consists of interogative word, auxillary verb, subject and main verb */
/*vs --> iw, av, np.*/ 

/*Interogative words*/
iw --> [what].

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
