"use strict";
/*

Merge sort is a recursive sorting algorithm that works by breaking down an array's elements into nested subarrays, then combining those nested subarrays back together in sorted order. 

It is best explained with an example. Given the array [9, 5, 7, 1], let's walk through the process of sorting it with merge sort. We'll start off by breaking the array down into nested subarrays:

[9, 5, 7, 1] -->
[[9, 5], [7, 1]] -->
[[[9], [5]], [[7], [1]]]

We then work our way back to a flat array by merging each pair of nested subarrays back together in the proper order:

[[[9], [5]], [[7], [1]]] -->
[[5, 9], [1, 7]] -->
[1, 5, 7, 9]

Write a function that takes an array argument and returns a new array that contains the values from the input array in sorted order. 
The function should sort the array using the merge sort algorithm as described above. You may assume that every element of the array will be of the same data type—either all numbers or all strings.

Feel free to use the merge function you wrote in the previous exercise.


PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: a flat array containing elements of all the same data type (either all numbers or all strings)
-  Output: a new flat array with the elements from the input array sorted using the merge sort algorithm

---

**Problem Domain:**

Merge sort is a *recursive* algorithm. It breaks an array's elements into nested subarrays until each subarray contains only a single element. It then combined the nested subarrays together in sorted order.

Remember, recursive functions must have:
  - A function call to itself
  - A break condition (AKA an endpoint that causes all recursive calls to "unravel")
  - A return value that somehow includes the result of the recursive call.

---

**Explicit Requirements:**
- We must return a new array.
- We can use the #merge function we wrote in the previous exercise.
- The mergeSort function must be a recursive function.
---


**Implicit Requirements:**
- The function must be named #mergeSort
---

**Clarifying Questions:**

1. None at this time.
2.
3.

---

**Mental Model:**

#mergeSort
- If the input array only has a single element, return the input array.
- Else split the input array into two halves.
- Recursively call mergeSort on each half.
- Return the result of using the #merge function on the returned arrays from the mergeSort calls.

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

mergeSort([9, 5, 7, 1]);           // [1, 5, 7, 9]
mergeSort([5, 3]);                 // [3, 5]
mergeSort([6, 2, 7, 1, 4]);        // [1, 2, 4, 6, 7]
// [6, 2, 7, 1, 4] ->
// [[6, 2, 7] , [1, 4]] ->
// [[[6, 2], [7]] , [[1], [4]]] ->
// [[[[6], [2]], [7]] , [[1], [4]]]  ----->

// [[[2, 6], [7]] , [1, 4]] ->
// [[2, 6, 7] , [1, 4]] ->
// [1, 2, 4, 6, 7] ->

mergeSort(['Sue', 'Pete', 'Alice', 'Tyler', 'Rachel', 'Kim', 'Bonnie']);
// ["Alice", "Bonnie", "Kim", "Pete", "Rachel", "Sue", "Tyler"]

mergeSort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]);
// [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]

---

Data Structure
--------------

Use arrays to manage the individual elements.

---

Algorithm
---------

#mergeSort
- If the input array only has a single element, return the input array.
- Else split the input array into two halves.
- Recursively call mergeSort on each half.
- Return the result of using the #merge function on the returned arrays from the mergeSort calls.

Code
----

*/

function mergeSort(inputArr) {
  if (inputArr.length === 1) return inputArr;

  let firstHalf = inputArr.slice(0, inputArr.length / 2);
  let secondHalf = inputArr.slice(inputArr.length / 2);

  return merge(mergeSort(firstHalf), mergeSort(secondHalf));
}


function merge(arr1, arr2) {
  if (arr1.length === 0) {
    return arr2.slice();
  } else if (arr2.length === 0) {
    return arr1.slice();
  }

  let mergedAndSorted = [];
  let arr1Copy = arr1.slice();
  let arr2Copy = arr2.slice();

  while (arr1Copy.length > 0 || arr2Copy.length > 0) {
    if (arr1Copy.length === 0) {
      mergedAndSorted.push(arr2Copy.shift());
      continue;
    } else if (arr2Copy.length === 0) {
      mergedAndSorted.push(arr1Copy.shift());
      continue;
    }

    if (arr1Copy[0] <= arr2Copy[0]) {
      mergedAndSorted.push(arr1Copy.shift());
    } else {
      mergedAndSorted.push(arr2Copy.shift());
    }
  }

  return mergedAndSorted;
}

console.log(mergeSort([9, 5, 7, 1]));           // [1, 5, 7, 9]
console.log(mergeSort([5, 3]));                 // [3, 5]
console.log(mergeSort([6, 2, 7, 1, 4]));        // [1, 2, 4, 6, 7]

console.log(mergeSort(['Sue', 'Pete', 'Alice', 'Tyler', 'Rachel', 'Kim', 'Bonnie']));
// ["Alice", "Bonnie", "Kim", "Pete", "Rachel", "Sue", "Tyler"]

console.log(mergeSort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]));
// [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]