Marie Curry
===========
a simple language for processing infite streams in lazy way
-------------------------------------------------------------

## Main features
- Marie Curry is a halfway between imperative and functional language, which gives both simplicity of imperative language, with possibilities of functional languages like higher-order functions, closures and currying
- Static strong type system, with support for structured types such as unit type, lists, pairs 
- In-built support for infite streams of integers, which are processed in lazy way
- Garbage collection based on reference counting - when returning from function call, memory cells with no reference are cleared
- Full support for exceptions and try-catch exceptions (very similar model to Java)
- Possibility to import libraries - interpreter is provided with standard prelude which contains higher-order functions for list processing, implementation of zip (similar to Haskell) and quicksort for lists of integers
- Basic syntax checker, which is a useful tool for giving human-readable error messages for common mistakes (like missing a semicolon)

## Type system

### Primitive types
- `int` - basic integer type, equivalent to Haskell's int datatype. Any valid number from Z within the 32-bit range is a constructor for this datatype
- `bool` - trivially it contains two constructors - `true` and `false`
- `char` - single ascii character
- `void` - standard return value for imperative bits of the language

### Structured types
- unit type - both type signature and value written as (), useful for allowing thunking/unthunking
- pairs - type singature in form (T1, T2), eg `(int, bool)`, constructor looks similar (val1, val2), eg `(5, true)` - language supports standard desctructors, ie. `fst`, `snd`
- lists - type signature in form `[T]` - language supports both `head` and `tail`, as well as `isEmpty`  - function which returns bool data type. Lists are constructed using `cons` (list constructor) and empty list `[]` - eg. `5 cons []` stands for singleton list containing only 5.
    - strings - Marie Curry supports strings as lists of char type, ie. [char]. Any quoted sequence of characters is treaded as string.

### Functions
In Marie Curry functions are first-class citizens of the language, and can be arguments or return types of other functions (functions are described in more detail in further parts). The type signature is T1->T2, eg int->int

### Additional types
As the language is statically strong typed, every expression must have a type, including an imperative style lists of operations to be executed in given order. That's why type checker provides additional type called Statement for correctly typed lists of operations, without any return statement. It is not available for user, as it is used for type-checking purposes only.

## Stream functions

### Input streams 
To support streams, Marie Curry interpreter contains a buffer. If at given time, program tries to consume value from n-th row, the interpreter will try to fetch the value from the buffer. If it is empty, the interpreter will block until an input line is provided and then interpreter parses the line, splitting the columns and saving values to the buffer. To correctly work with streams, user must first initialise the stream, by issuing the command `streams n;`, where n is a number. It will clear the buffer and prepare n slots for each of the rows.  

To consume a value from i-th row, user needs to use `consume (i-1);` keyword (i-1 comes from the fact that streams are indexed from 0). When trying to consume, without initialising buffer, a `StreamsNotInitialisedException` will be thrown. Also, if user tries to consume from stream with bigger index, then it was initialised, a `NotExistingStreamConsumptionException` will happen. As the streams are containing numbers, the return value of `consume` is an `int`.

Last, but not least - when EOF is read, the interpreter terminates its operation.

### Output stream
Output to standard output is handled using `print` operation. For orthogonality purposes, this keyword can output any closed value of the languauage and terminates it with a `\n` character.  

## Quick programming tutorial

### Control statements
#### Shape of the program
Every Marie Curry program is in the form:

    instruction 1;
    ...
    instruction n;
The interpreter executes all operations in sequence.

### Imperative sequence of statements
Any bit ot the code in the form

    {
        instruction 1;
        ...
        instruction n;
    }
is a statement, and its type is Statement, unless the last line of the statement is `return`. Then, the type of whole statement is type of the return value.

### Declaration and assignment of variables
To correctly use variables, each variable must be declared with giving a correct type and then a value must be assigned to it. Dereferencing is done by using variable name - eg. `x`.
When trying to dereference not existing variable, the `NullPointerException` will be thrown.

Example:

    int foo;
    foo = 8;

    [int] bar;
    bar = 3 cons [];

### Operations on values
- Integer operations:
    `+`,`-`,`*`,`/` (when dividing by 0 it will throw `DivideByZeroException`), `%`, `-` (unary negation)
- Integer predicates:
    `>`, `>=`, `==`, `!=`, `<`, `<=`
- Important: add comparison operator for tuples and lists as well
- Boolean operations:
    `&&`, `||`, `!`
- Boolean predicates: `!=`, `==`
- List constructor `cons`, correct usage `[int] list; list = 5 cons [];`
- List opearations `head`, `tail`, `isEmpty`
- Tuple destructors `fst`, `snd`

### Control statements
Marie Curry supports if-then, if-then-else and while expressions. All of them are of type Statement, however in case of if-then-else, if both branches have the same type, eg. int, then type of this whole expression is int. Condition in all those expressions of course must be of type boolean. Examples:

    if (x==5) {
        print 5;
    }

    if(x>8) {
        print false;
    } else {
        print true;
    }

    while(x<10) {
        print x;
        x = x + 1;
    }

### Functions




Named after Maria Sklodowska-Curie and Haskell Curry

