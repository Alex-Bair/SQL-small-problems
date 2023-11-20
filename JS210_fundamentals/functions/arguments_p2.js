let a = 7;

function myValue(a) {
  a += 10;
}

myValue(a);
console.log(a);

/*
The above code will log to the console:

7



On line 1, we declare and initialize global variable `a` to the number primitive `7`. Note that primitive values are immutable, meaning the value of global variable `a` can only be changed through reassignment.

Line 3 - 5 define the `myValue` function that takes a single argument `a`.

On line 7, we invoke the `myValue` function and pass in global variable `a` as an argument. 

Upon invocation of the `myValue` function, a local variable `a` scoped to the function is created and assigned to the passed in value `7`. Note that this local variable `a` scoped to the function is separate from the global variable `a` and shadows (i.e. prevents access to) the global variable `a` from within the `myValue` function.

On line 4 within the `myValue` function, we reassign local variable `a` to itself (`7`) plus `10`.

Outside of the function, on line 8, we log the value of the global variable `a` to the console, which is `7`.

*/