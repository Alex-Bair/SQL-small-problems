var myVar = 'This is global';

function someFunction() {
  var myVar = 'This is local';
}

someFunction();
console.log(myVar);

/* The above code will log:

This is global


On line 1, we declare and initialize variable `myVar` in the global scope to the string primitive 'This is global'.

On line 3, we declare and initialize variable `someFunction` to a function definition between the curly braces on lines 3 - 5. The function takes no arguments.
Line 4 within `someFunction`, we declare and initialize local variable `myVar` to the string primitive 'This is local'. This `myVar` variable is scoped to the `someFunction` function and shadows the `myVar` variable initialized on line 1 in the global scope. Any updates to `myVar` within the function will not affect the `myVar` variable in the global scope.

On line 7, we invoke the function referenced by `someFunction`.

On line 8, we log to the console the value referenced by `myVar` in the global scope. Since the `someFunction` function does not affect the value of the global variable `myVar`, 'This is global' is logged to the console.

*/