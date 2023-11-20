/*

A collection of spelling blocks has two letters per block, as shown in this list:

B:O   X:K   D:Q   C:P   N:A
G:T   R:E   F:S   J:W   H:U
V:I   L:Y   Z:M

This limits the words you can spell with the blocks to only those words that do not use both letters from any given block. You can also only use each block once.

Write a function that takes a word string as an argument and returns true if the word can be spelled using the set of blocks, false otherwise. You can consider the letters to be case-insensitive when you apply the rules.

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: string representing a word
-  Output: return a boolean representing whether the word input can be spelled with the spelling blocks

---

**Problem Domain:**
Nothing specific. See problem statement above.
---

**Explicit Requirements:**
- Function must check if the word string argument can be spelled using a single spelling block no more than once.
- Each block can only be used once. 
- Spelling blocks have two letters
- Consider letters to be case-insensitive when applying rules.
- Must return a boolean representing whether the word input can be spelled with the spelling blocks
---


**Implicit Requirements:**
- Function must be named isBlockWord
---

**Clarifying Questions:**

1. Can the same word from a single block be used once? i.e should isBlockWord("DUD") return true?
  No. 
2. Should we assume the input is always a string containing at least one letter?
  Yes.
3. Should we assume the input will always contain only letters?
  No. Do not consider non-letter characters when applying the rules.
---

**Mental Model:**

- Create an array with strings containing each spelling block's letters.
- Clean the input string of any non-letter characters and convert all letters to uppercase.
- Iterate over the uppercased letters in the cleaned input string.
  - If a block has been used already, return false.
  - Mark the appropriate block as used for the current character.
- Return true if iteration completes without returning early.

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

isBlockWord('BATCH');      // true
isBlockWord('BUTCH');      // false
isBlockWord('jest');       // true
isBlockWord('DUD');       // false
isBlockWord('dUd');       // false
isBlockWord('3BaTCH');    // true
isBlockWord('0=OXEN');    // true

---

Data Structure
--------------

To represent the spelling blocks, use an array like:
[
  'BO',
  'XK',
  'DQ',
  'CP',
  'NA',
  'GT',
  'RE',
  'FS',
  'JW',
  'HU',
  'VI',
  'LY',
  'ZM',
]

To represent whether a spelling block has been used, use an object to track which spelling blocks have been used for a given word. The keys for the object will be the strings in the above array. A boolean will represent whether the block has been used or not.
Ex:
{
  'BO': false,
  'XK': true,
  etc...
}

---

Algorithm
---------

- Create an array with strings containing each spelling block's letters.
- Clean the input string of any non-letter characters and convert all letters to uppercase.
  - Use a regex like /[^a-z]/ig to replace non-letters with empty strings.
  - Use String.prototype.toUpperCase() to convert all letters to uppercase.
- Iterate over the uppercased letters in the cleaned input string.
  - If a block has been used already, return false.
  - Mark the appropriate block as used for the current character.
- Return true if iteration completes without returning early.

Code
----
*/

function cleanInputString(str) {
  const NON_LETTER_REGEX = /[^a-z]/ig;

  return str.replaceAll(NON_LETTER_REGEX, '').toUpperCase();
}

function isBlockWord(inputStr) {
  const SPELLING_BLOCKS = [
                            'BO',
                            'XK',
                            'DQ',
                            'CP',
                            'NA',
                            'GT',
                            'RE',
                            'FS',
                            'JW',
                            'HU',
                            'VI',
                            'LY',
                            'ZM',
                          ];

  let blockUseTracker = {};

  let cleanedInput = cleanInputString(inputStr);

  for (let char of cleanedInput) {
    let block = SPELLING_BLOCKS.filter(blockLetters => blockLetters.includes(char))[0];

    if (blockUseTracker[block]) return false;
  
    blockUseTracker[block] = true;
  }

  return true;
}

console.log(isBlockWord('BATCH'));      // true
console.log(isBlockWord('BUTCH'));      // false
console.log(isBlockWord('jest'));       // true
console.log(isBlockWord('DUD'));       // false
console.log(isBlockWord('dUd'));       // false
console.log(isBlockWord('3BaTCH'));    // true
console.log(isBlockWord('0=OXEN'));    // true
console.log(isBlockWord('APPLE'));      // false
console.log(isBlockWord('apple'));      // false
console.log(isBlockWord('apPLE'));      // false
console.log(isBlockWord('Box'));        // false