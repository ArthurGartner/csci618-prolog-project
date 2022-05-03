# CSCI618 Prolog Project
Semester project for CSCI658 using prolog with nlp.

## Instructions

Place both `top_down.pl` and `bottom_up.pl` into the same directory.
Using a terminal navigate to the directory with both Prolog files.

To switch between .pl databases type in `halt.` then `Enter`. Then follow the provided instructions.

### top_down.pl
1. Type `swipl` then select `Enter` to enter the SWI-Prolog interpreter.
2. Once in the SWI-Prolog interpreter type in `[top_down].` then press `Enter` to load the top_down database.
3. Type in `re(X,[]).` then press `Enter` to view all valid strings. Select the `;` key to go to the next string if one exists.
4. To check a string input type in `re([A,B,C,...,n],[]).` where A,B,C,n are all characters then press `Enter`.
5. A return of `true` will occur if the string is valid.

### bottom_up.pl
1. Type `swipl` then select `Enter` to enter the SWI-Prolog interpreter.
2. Once in the SWI-Prolog interpreter type in `op(255,xfx,--->).` then press `Enter` to define the new operator.
3. Next type in `[bottom_up].` then press `Enter` to load the top_down database.
4. To test a string type in `post_order_traverse([A,B,C,...,n]).` where A,B,C,n are all characters then press `Enter`.
5. A return of `true` will occur if the string is valid.
6. To view the trace of the program as it executes type `trace` then press `Enter`.
7. To test a string type in `post_order_traverse([A,B,C,...,n]).` where A,B,C,n are all characters then press `Enter`.
8. A return of `true` will occur if the string is valid.

