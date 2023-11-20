

/*
The above code will log to the console:

undefined



During JavaScript's creation phase, it determines which identifiers will be needed during program execution. It sees on line 3 the `var a` statement, so it creates the global variable `a` and sets it to the primitive value `undefined`. This can also be thought of as JavaScript "hoisting" the `var a` declaration statement to the top of the program before the rest of the code.

Next, JavaScript begins its execution phase. 

On line 1, we log to the console the value of global variable `a`. Since `a` has been declared and set to `undefined`, we log `undefined` to the console. On line 3, we reassign global variable `a` to the number `1`, but this has no bearing on what is logged to the console. JavaScript does not perform this assignment during the creation phase, only during the execution phase.

*/