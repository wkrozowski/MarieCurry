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
- `char` - single ascii character - constructed with single quotes - eg. `'a'`
- `void` - standard return value for imperative bits of the language, both type signature and the only value of this type is `void`

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
    `>`, `>=`, `<`, `<=`
- Important: add comparison operator for tuples and lists as well
- Boolean operations:
    `&&`, `||`, `!`
- List constructor `cons`, correct usage `[int] list; list = 5 cons [];`
- List opearations `head`, `tail`, `isEmpty`
- Tuple destructors `fst`, `snd`
- Comparson predicates: `!=`, `==` - they work an all types besides Statement and Function Type

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
As mentioned before, in Marie Curry functions are first-class citizens of the language, and are treated as any other values in the langauges. They can be passed as parameters or be the return values of other functions. Functions introduce their own local scope, based on the inherited bindings from the global scope. Those references to global variables are stored in the "environment" and together with the closed function, they form closures. Functions are declared as any other variables, and then assignment is done by using lambda expressions.

The main syntax when declaring functions is:

    inputType -> returnType function;
    function = (inputType inputVariable) -> {
        statement 1;
        ...
        return (something of the return type);
    };

When the input type is unit type, the syntax is:

    () -> returnType function2;
    function2 = () -> {
        ...
    };

#### Functions with multiple parameters
Marie Curry,  as its name might suggest, supports curried functions. Therefore functions of multiple arguments are declared as nested lambda expressions, which take arguments, one followed by next one, for example:

    int -> int -> int addFun;
    addFun = \(int a) -> {
        \(int b) -> {
            return (a+b);
        };
    };

What is more, thanks to this approach it is possible to partially apply arguments of the function, for example while using previously defined `addFun` function, one could create `addTwo` function in the following way:

    int -> int addTwo;
    addTwo = addFun 2;

Using those features of the language (combined with earlier mentioned list types), it is really straightforward to implement popular higher-order functions like filter or map. Here is an example from Marie Curry's standard prelude:

    [int]->(int->int)->[int] mapInt;
    mapInt = \([int] list) -> {
	    \(int->int fun) -> {
		    if(isEmpty list) {
			    return [];
		    }
		    else {
			    return (fun (head list)) cons (mapInt (tail list) fun);
		    }
	    };
    };

One thing worth mentioning here is garabage collection. For example, let's have a function which contains some temporary value, which is only used in the local scope, eg:

    () -> int test;
    test = \() -> {
        int x;
        x = 7;

        return 42;
    };

Often calling this function could lead to creating multuple `x` variables, which are never used again. That's why, when switching environments, Marie Curry counts references to memory cells and performs garbage collection.

### Exceptions
Marie Curry provides support for exceptions, which are very similar to those known from Java. Available exceptions are:
- NullPointerException - thrown when trying to dereference null reference
- StreamsNotInitialisedException - thrown when performing streams operations, without previously initialising them
- NotExistingStreamConsumption - thrown when trying to consume from stream which wasn't initialised, eg. in code: `streams 4; consume 10;`
- ListEmptyException - when taking a head or tail of empty list
- DivideByZeroException
- TrapException - for use by programmer
Each of those exceptions can be also thrown by following line: `throw ExceptionName;`.

As for the handling, exceptions can be catched in try-catch blocks, which have the following structure:

    try {
        unsafe code
        ...
    } catch (ExceptionName) {
        exception handler
        ...
    }

If an exception is thrown and there is no exception handler at the top level, interpreter shows `Unhandled exception` error.

### Preprocessor and importing libraries 
Interpreter also contains preprocessor, which allows to include earlier created bits of code, such as libraries.
There is only one preprocessor directive, which is `import "path/to/file";`. Preprocessor goes recursively through the file looking for another import statements and then links all the code altogether.

Marie Curry is provided with standard prelude, which is in `lib/prelude.mc`. It contains:
- `concatInt` - for concatenating lists of int 
- `filterInt` - equivalent of Haskell's filter function for lists of ints
- `quicksort` - implementation of quicksort for lists of ints
- `mapInt` - equivalent of Haskell's map for lists of ints
- `forEachInt` - for each element of the list of ints it executes given function of signature `int- > ()` 
- `forEachChar` - same function, but for chars
- `concat` - concatenation of two list of chars (stirngs) into one

For example, quicksort is implemented using `filterInt` function:

    int -> int -> bool greaterOrEqual;
    greaterOrEqual = \(int p) ->{
        \(int q) -> {
            return p<q;
        };
    }; 

    int -> int -> bool smaller;
    smaller = \(int p) ->{
        \(int q) -> {
            return p>=q;
        };
    }; 

    [int] -> [int] quicksort;
    quicksort = \([int] list) -> {
        if (isEmpty list) {
            return [];
        } else {
            int pivot;
            [int] retVal;
            pivot = head list;
            [int] rest;
            rest = tail list;
            if (isEmpty rest) {
                retVal = (pivot cons []);
            }
            else {
                [int] rhs;
                rhs = (filterInt (rest) (greaterOrEqual pivot));

                [int] lhs;
                lhs = (filterInt (rest) (smaller pivot));
                retVal = concatInt (concatInt (quicksort lhs) (pivot cons [])) (quicksort rhs);	
            }

            return retVal;
        }
    };

## Execution model

### Lexer, Parser, Syntax Checker and Preprocessor
When processing source code, interpreter runs the lexer. Then scanned tokens are passed to syntax checker, which looks for common patterns of errors made by programmers, like forgotten semicolons. By using Alex Posn wrapper it provides meaningful information about the syntax errors, for example:

    Missing ';' after "NullPointerException" at line 43 column 15

After passing the syntax checker, the sequence of tokens is processed by parser, which also provides meaningful error messages for the developer. Upon parsing, whole parse tree is passed to the preprocessor, which looks for `include` statements and runs lexer, syntax checker and parser on libraries and then performs linking. 

### Type checker
Marie Curry is a statically strong typed language, and therefore each source file is type checked before execution. Type checker recursively goes through the parse tree and checks the type correctness and binds decalred names to their types in type environments. Also, type checker provides useful error messages for developer, for example:

    Right hand side of multiplication is not an int
    Cannot apply value to non-function
    Trying to take a tail from value which is not a list

After the type checking, the tree is converted into simplified intermediate code, which doesn't contain type annotations and is passed to an evaluator.

### Evaluator
The core of Marie Curry is a machine-based evaluator, based on a CESK-style Call-By-Value operational semantics. The main difference between Marie Curry interpreter and CESK machine is an additional field, known as buffer which describes the current state of the stream buffer. Environments are associative data structures describing current scope, and point to virtual memory addresses of elements in the store. When switching betweem environments on return from funcion, interpreter runs a garbage collector which compares the references of all environments and occupied memory addresses and frees unused memory cells. When processing an input line, whole line is parsed and then placed in the buffer. When consuming from the stream, first buffer is checked and if it is empty then evaluator goes to blocking state of waiting for input line. It allows the "lazy" processing of streams.

