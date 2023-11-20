"use strict";
/*

'Bubble Sort' is one of the simplest sorting algorithms available. Although it is not an efficient algorithm, it is an excellent exercise for student developers. In this exercise, you will write a function that sorts an array using the bubble sort algorithm.

A bubble sort works by making multiple passes (iterations) through an array. On each pass, the two values of each pair of consecutive elements are compared. If the first value is greater than the second, the two elements are swapped. This process is repeated until a complete pass is made without performing any swaps — at which point the array is completely sorted.

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: an array containing at least two elements
-  Output: the mutated input array sorted using bubble sort

---

**Problem Domain:**

Bubble sort works by making multiple passes through an array.

On each pass, the two values of each pair of consecutive elements are compared.
  If the first value is greater than the second, the two elements are swapped.
This process repeats until no swaps are made

---

**Explicit Requirements:**
- Must use bubble sort algorithm in function
- Must mutate the input array
- The input array must be sorted using bubble sort.
---


**Implicit Requirements:**
- Elements must be sorted based on their type
  i.e. numbers are sorted numerically while strings are sorted alphabetically
- function should be named bubbleSort
---

**Clarifying Questions:**

1. Are sparse arrays valid inputs?
  No, do not try to work with sparse arrays.
2. Will the input array always contain elements of a single type? i.e. all elements are number OR all elements are strings?
  Yes.
3. Will the input array elements either be numbers or strings? i.e. no arrays, objects, BigInts, etc.
  Yes.
4. Will a single array always be passed to the function?
  Yes
5. Will there ever be more than one argument passed to the function?
  No.

---

**Mental Model:**

- Enter a loop (will be the "pass" through the array)
  - Declare and initialize a variable `swapPerformed` to false to track whether a swap was performed on this iteration
  - Iterate over the input array. 
    - If the current element is greater than the next element, 
        swap their positions
        set `swapPerformed` to true
  - If `swapPerformed` is false, break out of the loop.
- Return a reference to the mutated input array.

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

const array1 = [5, 3];
bubbleSort(array1);
console.log(array1);    // [3, 5]

const array2 = [6, 2, 7, 1, 4];
bubbleSort(array2);
console.log(array2);    // [1, 2, 4, 6, 7]

const array3 = ['Sue', 'Pete', 'Alice', 'Tyler', 'Rachel', 'Kim', 'Bonnie'];
bubbleSort(array3);
console.log(array3);    // ["Alice", "Bonnie", "Kim", "Pete", "Rachel", "Sue", "Tyler"]

---

Data Structure
--------------

Use the input array during interation. Allows us to mutate the array as needed.

---

Algorithm
---------

- Enter a loop (will be the "pass" through the array)
  - Declare and initialize a variable `swapPerformed` to false to track whether a swap was performed on this iteration
  - Iterate over the input array (iterate the indexes from 0 to the length of the array - 2)
    - If the current element is greater than the next element, 
        swap their positions using splice
        set `swapPerformed` to true
  - If `swapPerformed` is false, break out of the loop.
- Return a reference to the mutated input array.

Code
----

*/

function bubbleSort(array) {
  const penultimateIndex = array.length - 2;

  while(true) {
    let swapPerformed = false;

    for (let index = 0; index <= penultimateIndex; index += 1) {
      let currentElement = array[index];
      let nextElement = array[index + 1];
      
      if (currentElement > nextElement) {
        array.splice(index, 2, nextElement, currentElement);
        swapPerformed = true;
      }
    }

    if (!swapPerformed) break;
  }

  return array;
}

const array1 = [5, 3];
bubbleSort(array1);
console.log(array1);    // [3, 5]

const array2 = [6, 2, 7, 1, 4];
bubbleSort(array2);
console.log(array2);    // [1, 2, 4, 6, 7]

const array3 = ['Sue', 'Pete', 'Alice', 'Tyler', 'Rachel', 'Kim', 'Bonnie'];
bubbleSort(array3);
console.log(array3);    // ["Alice", "Bonnie", "Kim", "Pete", "Rachel", "Sue", "Tyler"]