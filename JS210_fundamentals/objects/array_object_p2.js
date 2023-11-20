// const myArray = [5, 5];
// myArray[-1] = 5;
// myArray[-2] = 5;

// function average(array) {
//   let sum = 0;

//   for (let i = -2; i < array.length; i += 1) {
//     sum += array[i];
//   }

//   return sum / array.length;
// }

// average(myArray);

/*

The user's expectation of the average(myArray) function call to return 5 in the code above is wrong.
An array's length returns the highest positive integer index of the array plus 1. Since the highest positive integer index of the myArray array is 1, then the length of the array is 2.
In the for loop from lines 8 - 10, we add the values of the '-1' and '-2' properties of the array to the sum, but then on line 12 we divide by 2 (the array's length) despite summing 4 elements.
This means that the average function is not properly calculating the average of the array, and will not return 5 on line 15.

*/

// Further Exploration

const myArray = [5, 5];
myArray[-1] = 5;
myArray[-2] = 5;

function average(array) {
  let sum = 0;

  for (let key in array) {
    sum += array[key];
  }

  return sum / Object.keys(array).length;
}

console.log(average(myArray));