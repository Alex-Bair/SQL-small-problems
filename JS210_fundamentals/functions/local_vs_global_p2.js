var myVar = 'This is global';

function someFunction() {
  var myVar = 'This is local';
  console.log(myVar);
}

someFunction();


/*
The above code will log:

This is local.

On line 1, we declare and initialize variable `myVar` in the global scope to the string primitive 'This is global'.

Line 3 - 6 declare and initilize variable `someFunction` to a function definition. 

On line 8, we invoke the `someFunction` function.

Within the `someFunction` function on line 4, we declare and initialize a local variable `myVar` to the string primitive 'This is local'. This shadows access to the global `myVar` variable from within the function - although the local variable `myVar` shares the same name, it is a separate, distinct variable form the global variable initialized on line 1.
On line 5, we log to the console the value of the `myVar` local variable, which is 'This is local'.

*/