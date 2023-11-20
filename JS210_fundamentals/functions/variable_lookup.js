var myVar = 'This is global';

function someFunction() {
  console.log(myVar);
}

someFunction();

/*
The above code will log to the console:

This is global


On line 1, we declare and initialize global variable `myVar` to the string primitive 'This is global'.

Lines 3 - 5 contain the function definition for the `someFunction` function.

On line 7, we invoke the `someFunction` function.

Within the `someFunction` function on line 4, we log to the console the value of the global variable `myVar`, which is the string 'This is global'.

*/