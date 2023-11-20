/*

You have a bank of switches before you, numbered from 1 to n. Every switch is connected to exactly one light that is initially off. You walk down the row of switches and toggle every one of them. You walk back to the beginning of the row and start another pass. On this second pass, you toggle switches 2, 4, 6, and so on. On the third pass, you go back to the beginning again, this time toggling switches 3, 6, 9, and so on. You continue to repeat this process until you have gone through n repetitions.

Write a program that takes one argument—the total number of switches—and returns an array of the lights that are on after n repetitions.

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: a number `n` that represents the total number of switches
-  Output: an array of numbers representing the lights that are on after making n passes through the lights

---

**Problem Domain:**

- On the nth pass, we flip the light switches for every light whose number is a factor of n. i.e. on the nth pass, we flip a light switch if we can evenly divide that switch's number by n.

---

**Explicit Requirements:**
- Must take a single argument `n` that is a number.
- Must return an array of numbers representing the lights on after `n` passes through the set of lights
---


**Implicit Requirements:**
- On the nth pass, we flip the light switches for every light whose number is a factor of n. i.e. on the nth pass, we flip a light switch if we can evenly divide that switch's number by n.
- function should be named lightsOn(switches)

---

**Clarifying Questions:**

1. Will the input always be a number?
  Yes.
2. Will the input always be an integer?
  Yes.
3. Will the input always be 1 or greater?
  Yes.

---

**Mental Model:**

- Create an array to represent the total number of light switches, all off initially.
- Iterate from 1 to the total number of light switches `n`. Call the iteration number `iteration`
  - Flip the switch of every light whose number is a factor of `iteration`.
- Return an array containing only the lights who are on after the iteration completes.

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

function lightsOn(switches) {
  // ...
}

lightsOn(5);        // [1, 4]
// Detailed result of each round for `5` lights
// Round 1: all lights are on
// Round 2: lights 2 and 4 are now off;     1, 3, and 5 are on
// Round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
// Round 4: lights 2 and 3 are now off;     1, 4, and 5 are on
// Round 5: lights 2, 3, and 5 are now off; 1 and 4 are on

lightsOn(100);      // [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]

---

_Your Test Cases:_

lightOn(1); // [1]
lightOn(2); // [1]
lightOn(3); // [1]
lightOn(4); // [1, 4]

---

Data Structure
--------------

Use an array to represent the set of light switches.

Ex: when there are 5 light switches, the array will be 
  [false, false, false, false, false]
  
Where the `false` boolean means that the light at that index is off, and the `true` boolean means that the light at that index is on.

The index in the array is equal to the light number - 1.

---

Algorithm
---------

- Create an array to represent the total number of light switches, all off initially.
  - An array with length `switches` that contains all `false`.
- Iterate from 1 to `switches`. Call the iteration number `iteration`
  - Map (transform) the array of booleans representing the switches' status.
    - Initialize a variable `lightNumber` to `index` + 1.
    - If `lightNumber` is a factor of `iteration`, then flip the light's status and return it.
    - Else, return the light's current status.
- Map the array of booleans:
  - If the element is `true` (i.e. the light is on), then return the element's index + 1 (i.e. the light number)
  - Otherwise return the element's current value (which would be `false`)
- Filter only the number values from the array and return the filtered array.

Code
----
*/

// function lightsOn(switches) {
//   let arrayOfSwitchStatus = Array(switches).fill(false)

//   for (let iteration = 1; iteration <= switches; iteration += 1) {
//     arrayOfSwitchStatus = arrayOfSwitchStatus.map((status, index) => {
//       let lightNumber = index + 1;
//       if (lightNumber % iteration === 0) {
//         return !status;
//       } else {
//         return status;
//       }
//     });
//   }

//   let lightNumbersOn = arrayOfSwitchStatus.map((status, index) => {
//     let lightNumber = index + 1;
//     if (status) return lightNumber;
//     return status;
//   });

//   return lightNumbersOn.filter(element => element);
// }

console.log(lightsOn(1));         // [1]
console.log(lightsOn(2));         // [1]
console.log(lightsOn(3));         // [1]
console.log(lightsOn(4));         // [1, 4]
console.log(lightsOn(5));        // [1, 4]
console.log(lightsOn(100));      // [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]

// Noticing that the results array always contains perfect squares that are less than or equal to the input number:

function lightsOn(max) {
  let lights = [];

  for (let num = 1; num <= max; num +=1) {
    if (isPerfectSquare(num)) {
      lights.push(num);
    }
  }

  return lights;
}

function isPerfectSquare(number) {
  let sqrt = Math.sqrt(number);
  return sqrt === Math.trunc(sqrt);
}