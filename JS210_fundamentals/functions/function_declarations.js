logValue();

function logValue() {
  console.log('Hello, world!');
}


/*
The above code will log to the console:

Hello, world!


During JavaScript's creation phase, it will determine what identifiers will be needed during the program's execution phase. It determines that the `logValue` function definition on lines 3 - 5 will be needed during execution and load it into memory. This can be thought of as JavaScript "hoisting" the `logValue` function declaration (meaning the function name and function body) to the top of its encompassing scope - i.e. the global scope in this example.

Since the `logValue` function is already in memory before it is invoked on line 1, we successfully log 'Hello, world!' to the console.
*/

// Further exploration

var logValue = 'foo';

function logValue() {
  console.log('Hello, world!');
}

console.log(typeof logValue);



/*
After the refactoring, the above code logs to the console:

string


This is because the assignment of variable `logValue` to string 'foo' is NOT hoisted. It ends up being executed after the function declaration for `logValue` is loaded into memory.


The hoisted equivalent of this code is:

function logValue() {
  console.log('Hello, world!');
}

var logValue

logValue = 'foo';

console.log(typeof logValue);
*/