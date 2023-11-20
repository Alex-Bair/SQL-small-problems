var myVar = 'This is global';

function someFunction() {
  myVar = 'This is local';
}

someFunction();
console.log(myVar);

/*
The above code will log to the console:

This is local


On line 1, we declare and initialize global variable `myVar` to the string primitive 'This is global'.

On lines 3 - 5, we define the `someFunction` function.

On line 7, we invoke the `someFunction` function.

Within the `someFunction` function on line 4, we reassign the global variable `myVar` to the string 'This is local'. Since there is not a separate variable of the same name scoped to the function, we are able to access and reassign the global `myVar` variable from within the `someFunction` function.

On line 8, we log to the console the value of the `myVar` variable, which is 'This is local'


*/