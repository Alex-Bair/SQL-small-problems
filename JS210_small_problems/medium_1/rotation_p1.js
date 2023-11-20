"use strict";
/*

Write a function that rotates an array by moving the first element to the end of the array. Do not modify the original array.

If the input is not an array, return undefined.
If the input is an empty array, return an empty array.
Review the test cases below, then implement the solution accordingly.

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: an array
-  Output: a new array containing the same elements as the input array, but with all elements shifted to the left (the first element is moved to the end of the array)

---

**Problem Domain:**
Nothing specific.
---

**Explicit Requirements:**
- If the input is not an array, return undefined.
- If the input is an empty array, return an empty array.
- The input array should not be mutated.
- A new array should be returned.
- The first element of the input array should be at the end of the new, returned array.
---


**Implicit Requirements:**
- The function should be named rotateArray
---

**Clarifying Questions:**

1. Any elements in the input array should not be mutated, correct?
  Yes.
2. Should the returned array be a shallow copy of the input array, but with the first element of the input array at the end of the returned array?
  Yes.
3. Should non-element properties of the input array be copied to the returned array?
  Yes, but these elements should not be mutated.
4. In the case of an empty array input, will an empty array input ever have any non-negative integer elements?
  No.
5. Will the input ever be a sparse array? 
  No. 

---

**Mental Model:**

- Validate input. Return undefined if the input is not an array. Return an empty array if the input is an empty array.
- Copying the input array.
- Destructively remove the first element of the shallow copy. Append it to the end of the shallow copy.
- Return the mutated, copied array.

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

rotateArray([7, 3, 5, 2, 9, 1]);       // [3, 5, 2, 9, 1, 7]
rotateArray(['a', 'b', 'c']);          // ["b", "c", "a"]
rotateArray(['a']);                    // ["a"]
rotateArray([1, 'a', 3, 'c']);         // ["a", 3, "c", 1]
rotateArray([{ a: 2 }, [1, 2], 3]);    // [[1, 2], 3, { a: 2 }]
rotateArray([]);                       // []

// return `undefined` if the argument is not an array
rotateArray();                         // undefined
rotateArray(1);                        // undefined
rotateArray('a');                      // undefined
rotateArray({ a: 2 });                 // undefined


// the input array is not mutated
const array = [1, 2, 3, 4];
rotateArray(array);                    // [2, 3, 4, 1]
array;                                 // [1, 2, 3, 4]

---

Data Structure
--------------

- Use an array to contain the element of the input array. Create this array by generating a shallow copy of the input array.

---

Algorithm
---------

- Validate input. 
  - Return undefined if the input is not an array. 
  - Return an empty array if the input is an empty array.
- Create a shallow copy of the input array.
- Destructively remove (shift) the first element of the shallow copy array. Push it to the end of the shallow copy array.
- Return the mutated, copied array.

Code
----
*/

function rotateArray(inputArr) {
  if (!Array.isArray(inputArr)) return undefined;
  if (inputArr.length === 0)    return [];

  let arrCopy = inputArr.slice(1);

  if (isFirstIndexEmpty(inputArr)) {
    arrCopy.length += 1;
  } else {
    arrCopy.push(inputArr[0]);
  }

  return arrCopy;
}

function isFirstIndexEmpty(arr) {
  let firstElement = arr.slice(0,1);

  return firstElement.flat().length === 0;
}

rotateArray([7, 3, 5, 2, 9, 1]);       // [3, 5, 2, 9, 1, 7]
rotateArray(['a', 'b', 'c']);          // ["b", "c", "a"]
rotateArray(['a']);                    // ["a"]
rotateArray([1, 'a', 3, 'c']);         // ["a", 3, "c", 1]
rotateArray([{ a: 2 }, [1, 2], 3]);    // [[1, 2], 3, { a: 2 }]
console.log(rotateArray([]));                       // []

// return `undefined` if the argument is not an array
console.log(rotateArray());                         // undefined
console.log(rotateArray(1));                        // undefined
console.log(rotateArray('a'));                      // undefined
console.log(rotateArray({ a: 2 }));                 // undefined


// the input array is not mutated
const array = [1, 2, 3, 4];
rotateArray(array);                    // [2, 3, 4, 1]
console.log(array);                                 // [1, 2, 3, 4]

// empty spots in sparse arrays are maintained
let arr = [];
arr[4] = 1;
rotateArray(arr);                      // [<3 empty slots>, 1, <1 empty slot>]