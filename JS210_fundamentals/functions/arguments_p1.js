let a = 7;

function myValue(b) {
  b += 10;
}

myValue(a);
console.log(a);

/*
The above code will log to the console:

7


On line 1, we declare and initialize global variable `a` to the number primitive `7`. Note: `7` is a primitive value and primitive values are immutable.

On lines 3 - 5, we define the `myValue` function that takes a single argument `b`.

On line 7, we invoke the `myValue` function and pass in global variable `a` (currently pointing to the number `7`) as an argument.

Upon invocation of the `myValue` function, local variable `b` is assigned to the passed in argument `7`. On line 4 within the function, local variable `b` is reassigned to itself (`7`) plus `10`. Reassignment of local variable `b` does not affect the value referenced by global variable `a` since JavaScript exhibits pass-by-value behavior when passing in primitive arguments to functions.

On line 8, we log to the console the value of global variable `a`, which is `7`.

*/
