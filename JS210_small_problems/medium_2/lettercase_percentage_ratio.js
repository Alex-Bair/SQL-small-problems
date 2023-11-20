"use strict";
/*

Write a function that takes a string and returns an object containing the following three properties:

the percentage of characters in the string that are lowercase letters
the percentage of characters that are uppercase letters
the percentage of characters that are neither
You may assume that the string will always contain at least one character.

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: a string
-  Output: return an object with properties
              - percent of characters in string that are lowercase letters
              - percent of characters in string that are uppercase letters
              - percent of characters in string that are neither

---

**Problem Domain:**
Nothing specific.
---

**Explicit Requirements:**
- Assume the string will contain at least one character
---


**Implicit Requirements:**
- The returned object should have strings as values, formatted like:
  "50.00" for 50.00%.
- Any non letter strings are considered to be not lowercase and not uppercase (i.e. they contribute to the neither count)
- The object should have three keys always:
    lowercase
    uppercase
    neither
---

**Clarifying Questions:**

1. Will the input always be a string?
  yes.
2. Will the input always contain at least one charcter?
  yes
3. Should we round up or down when determining the percentage? In otherwords, if the string is 54.534% lowercase letters, how should that be presented? As "54.53" or "54.54"?
  Round to the nearest tenth.
4. Should the percentages always add up to 100?
  Yes.

---

**Mental Model:**

- Count the number of characters in the string.
- Count the number of lowercase letter characters in the string. Determine the percentage.
- Count the number of uppercase letter characters in the string. Determine the percentage.
- Create an object with the appropriate percentages formatted as strings with only two decimal places
  - Determine the neither percent by subtracting the lowercase and uppercase percent from 100.
---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

letterPercentages('abCdef 123');
// { lowercase: "50.00", uppercase: "10.00", neither: "40.00" }

letterPercentages('AbCd +Ef');
// { lowercase: "37.50", uppercase: "37.50", neither: "25.00" }

letterPercentages('123');
// { lowercase: "0.00", uppercase: "0.00", neither: "100.00" }


letterPercentages('aB3');
// { lowercase: "33.33", uppercase: "33.33", neither: "33.34" }
---

---

Data Structure
--------------

{ lowercase: "50.00", uppercase: "10.00", neither: "40.00" }

---

Algorithm
---------

- Count the number of characters in the string.
- Count the number of lowercase letter characters in the string. Determine the percentage by dividing by the length of the string and multiplying by 100.
- Count the number of uppercase letter characters in the string. Determine the percentage by dividing by the length of the string and multiplying by 100.
- Determine the neither percent by subtracting the lowercase and uppercase percent from 100.
- Create an object with the appropriate percentages formatted as strings with only two decimal places


Code
----

*/

function letterPercentages(inputString) {
  let length = inputString.length;

  let lowerCasePercent = (inputString.match(/[a-z]/g) || []).length * 100 / length;
  let upperCasePercent = (inputString.match(/[A-Z]/g) || []).length * 100 / length;

  let neitherPercent = 100 - Number(lowerCasePercent.toFixed(2)) - Number(upperCasePercent.toFixed(2));

  return {
    lowercase: lowerCasePercent.toFixed(2),
    uppercase: upperCasePercent.toFixed(2),
    neither: neitherPercent.toFixed(2),
  };
}

console.log(letterPercentages('abCdef 123'));
// { lowercase: "50.00", uppercase: "10.00", neither: "40.00" }

console.log(letterPercentages('AbCd +Ef'));
// { lowercase: "37.50", uppercase: "37.50", neither: "25.00" }

console.log(letterPercentages('123'));
// { lowercase: "0.00", uppercase: "0.00", neither: "100.00" }


console.log(letterPercentages('aB3'));
// { lowercase: "33.33", uppercase: "33.33", neither: "33.34" }