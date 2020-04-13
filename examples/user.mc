include "lib/prelude.mc";

[int] myList;
myList = 8 cons  (5  cons  []);
int x;
x = 0;
while (x < 20)
{
        myList = x cons myList;
        x = x + 1;
}

[int] rest;
int pivot;

pivot = 8;
rest = 7 cons (6 cons (5 cons (4 cons (3 cons (2 cons (1 cons (0 cons (8 cons (5 cons [])))))))));
[int] retVal;

int -> bool predicate;
predicate = smaller 8;int -> bool predicate;
predicate = smaller 8;

if (predicate (head rest)) {
	print "predicate met";
	retVal = (head rest) cons (filterInt (rest) predicate);
}
else {

print "boom";
retVal = (filterInt (rest) predicate);
