function someFunction() {
  myVar = 'This is global';
}

someFunction();
console.log(myVar);

/*
The above code will log to the console:

This is global


On lines 1 - 3, the `someFunction` function is defined.

On line 5, we invoke the `someFunction` function.

Within the `someFunction` function on line 2, we bind `myVar` as a "property" of the global object with a value of the string primitive 'This is global'.

On line 6, we log to the console the value of the `myVar` global property, which is 'This is global.'
*/