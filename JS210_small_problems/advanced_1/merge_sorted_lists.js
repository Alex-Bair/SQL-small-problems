"use strict";
/*

Write a function that takes two sorted arrays as arguments and returns a new array that contains all the elements from both input arrays in sorted order.

You may not provide any solution that requires you to sort the result array. You must build the result array one element at a time in the proper order.

Your solution should not mutate the input arrays.

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: two sorted arrays
-  Output: a single array containing all elements from the two input arrays in sorted order

---

**Problem Domain:**
Nothing specific.
---

**Explicit Requirements:**
- We cannot mutate the input arrays
- We should not sort the result array. Rather, we should *build* the result array one element at a time in the proper order.
---


**Implicit Requirements:**
- If one of the input arrays is an empty array, return a new array containing elements from the other input array.
---

**Clarifying Questions:**

1. If both input arrays are non-empty, will the elements in both arrays be comparable to one another? (i.e. all elements are numbers OR all elements are strings)
  Yes.
2. Will either input array every be sparse?
  No.

---

**Mental Model:**

- If one of the input arrays is empty, return a copy of the other array.
- Declare and initialize an empty results array.
- Enter a loop. Continue iterating until both arrays are empty.
  - If one of the arrays is an empty array, 
      remove the first element from the other array and push it onto the results array.
  - Otherwise, compare the first element of each array to one another.
    - Remove the lesser element from its array and push it onto the results array.
- Return the results array.

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

merge([1, 5, 9], [2, 6, 8]);      // [1, 2, 5, 6, 8, 9]
merge([1, 1, 3], [2, 2]);         // [1, 1, 2, 2, 3]
merge([], [1, 4, 5]);             // [1, 4, 5]
merge([1, 4, 5], []);             // [1, 4, 5]
---

_Your Test Cases:_

-  Example 3
  -  Inputs:
  -  Output:

---

_Your Edge Cases:_

-  Example 4
  -  Inputs:
  -  Output:

---

Data Structure
--------------

- Use an array to contain the sorted elements.

---

Algorithm
---------

- If one of the input arrays is empty, return a copy of the other array.
- Declare and initialize an empty results array.
- Enter a loop. Continue iterating until both arrays are empty.
  - If one of the arrays is an empty array, 
      remove the first element from the other array and push it onto the results array.
  - Otherwise, compare the first element of each array to one another.
    - Remove the lesser element from its array and push it onto the results array.
- Return the results array.

Code
----

*/

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

  console.log(mergedAndSorted);

  return mergedAndSorted;
}

merge([1, 5, 9], [2, 6, 8]);      // [1, 2, 5, 6, 8, 9]
merge([1, 1, 3], [2, 2]);         // [1, 1, 2, 2, 3]
console.log(merge([], [1, 4, 5]));             // [1, 4, 5]
console.log(merge([1, 4, 5], []));             // [1, 4, 5]