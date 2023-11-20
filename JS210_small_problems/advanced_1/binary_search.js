"use strict";
/*

A binary search algorithm is a much more efficient alternative. 
This algorithm allows you to cut the search area in half on each iteration by discarding the half that you know your search term doesn't exist in. 
The binary search algorithm is able to do this by relying on the data being sorted. Going back to the yellow pages example, let's say that we're searching the following yellowPages data for the search item 'Pizzeria':

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: a sorted array and an element that could be in the array
-  Output: the index of the element within the input array (or -1 if the element is not in the array)

---

**Problem Domain:**

In a binary search, we:
- retrieve the middle value from the data (assume truncation to integer)
- If the middle value is equal to the search value, stop the search.
- If the middle value is less than the search value,
  - discard the lower half, including the middle value
  - Repeat the process from the top, using the upper half as the starting data.
- If the middle value is greater than the search value, do the same as the previous step, but with opposite halves.

---

**Explicit Requirements:**
- The function must be named binarySearch.
- Must return index of the search item OR -1 if the search item does not exist in the input array.
- Assume the array argument is always sorted.
---


**Implicit Requirements:**
- 
---

**Clarifying Questions:**

1. None at this time.
2.
3.

---

**Mental Model:**

- If the input array is an empty array, return -1.

- Determine the middle index of the input array.
- If the element at the middle index of the input array is strictly equal to the search item, return the middle index.
- If the element at the middle index of the input array is less than the search item,
  - Perform a binary search on the top half of the input array.
    - If the returned value is -1, return -1.
    - Else return the middle index + 1 + the returned value from the binary search.
- Else
  - Perform a binary search on the bottom half of the input array.
    - Return the returned value from the binary search.

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

const yellowPages = ['Apple Store', 'Bags Galore', 'Bike Store', 'Donuts R Us', 'Eat a Lot', 'Good Food', 'Pasta Place', 'Pizzeria', 'Tiki Lounge', 'Zooper'];
binarySearch(yellowPages, 'Pizzeria');                   // 7
binarySearch(yellowPages, 'Apple Store');                // 0

binarySearch([1, 5, 7, 11, 23, 45, 65, 89, 102], 77);    // -1
binarySearch([1, 5, 7, 11, 23, 45, 65, 89, 102], 89);    // 7
binarySearch([1, 5, 7, 11, 23, 45, 65, 89, 102], 5);     // 1

binarySearch(['Alice', 'Bonnie', 'Kim', 'Pete', 'Rachel', 'Sue', 'Tyler'], 'Peter');  // -1
binarySearch(['Alice', 'Bonnie', 'Kim', 'Pete', 'Rachel', 'Sue', 'Tyler'], 'Tyler');  // 6

---

Data Structure
--------------

---

Algorithm
---------

- If the input array is an empty array, return -1.

- Determine the middle index of the input array.
- If the element at the middle index of the input array is strictly equal to the search item, return the middle index.
- If the element at the middle index of the input array is less than the search item,
  - Perform a binary search on the top half of the input array.
    - If the returned value is -1, return -1.
    - Else return the middle index + 1 + the returned value from the binary search.
- Else
  - Perform a binary search on the bottom half of the input array.
    - Return the returned value from the binary search.

Code
----

*/

function binarySearch(inputArr, searchItem) {
  if (inputArr.length === 0) return -1;

  const middleIndex = Math.floor(inputArr.length / 2);
  const middleItem = inputArr[middleIndex];

  if (middleItem === searchItem) {
    // the middleItem is the searchItem we're looking for
    return middleIndex;
  } else if (middleItem < searchItem) {
    // the middleItem is less than the searchItem, meaning we need to perform a binary search on the top half of the array
    let searchResult = binarySearch(inputArr.slice(middleIndex + 1), searchItem);

    return (searchResult === -1 ? -1 : middleIndex + 1 + searchResult);
  } else {
    // the middleItem is greater than the searchItem, meaning we need to perform a binary search on the lower half of the array
    return binarySearch(inputArr.slice(0, middleIndex), searchItem);
  }
}

const yellowPages = ['Apple Store', 'Bags Galore', 'Bike Store', 'Donuts R Us', 'Eat a Lot', 'Good Food', 'Pasta Place', 'Pizzeria', 'Tiki Lounge', 'Zooper'];
console.log(binarySearch(yellowPages, 'Pizzeria'));                   // 7
console.log(binarySearch(yellowPages, 'Apple Store'));                // 0

console.log(binarySearch([1, 5, 7, 11, 23, 45, 65, 89, 102], 77));    // -1
console.log(binarySearch([1, 5, 7, 11, 23, 45, 65, 89, 102], 89));    // 7
console.log(binarySearch([1, 5, 7, 11, 23, 45, 65, 89, 102], 5));     // 1

console.log(binarySearch(['Alice', 'Bonnie', 'Kim', 'Pete', 'Rachel', 'Sue', 'Tyler'], 'Peter'));  // -1
console.log(binarySearch(['Alice', 'Bonnie', 'Kim', 'Pete', 'Rachel', 'Sue', 'Tyler'], 'Tyler'));  // 6