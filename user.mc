include "lib/prelude.mc";

[int] myList;
myList = 3 cons (2 cons (1 cons []));

print quicksort myList;