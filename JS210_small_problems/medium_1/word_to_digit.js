"use strict";
/*

Write a function that takes a sentence string as an argument and returns that string with every occurrence of a "number word" — 'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine' — converted to its corresponding digit character.

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: a string sentence
-  Output: the input string sentence with any "number word" replaced with its corresponding digit character

---

**Problem Domain:**
Nothing specific.
---

**Explicit Requirements:**
- We must convert "number words" between zero and nine to their corresponding digits (0 - 9)
- We must return a string.
---


**Implicit Requirements:**

- The input string will be sentences delimited by punctuation.
- A sentence will be words delimited by spaces.
- The function must be named wordToDigit
---

**Clarifying Questions:**

1. Will sentences always end in periods? (.)
  Yes.
2. Does case of the "number word" matter?
  No.
3. Will words be delimited by spaces?
  Yes.
4. Do we only need to replace number words for digits 0 - 9? i.e. we don't need to replace "ten" with 10?
  Correct.

---

**Mental Model:**

- Split the input string into an array of sentences (delimiting by periods (.)).
- Split the sentences into individual words (delimiting by spaces).
- Iterate through the words and replace any "number words" with the appropriate number.
- Join the words together with spaces.
- Join the sentences together with periods.

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

wordToDigit('Please call me at five five five one two three four. Thanks.');
// "Please call me at 5 5 5 1 2 3 4. Thanks."

wordToDigit(' zero ZERO zErO oNe. How is it tWo already.')
// ' 0 0 0 1. How is it 2 already.'

wordToDigit('zero one two three four five six seven eight nine')
// '0 1 2 3 4 5 6 7 8 9'

wordToDigit('Throw Fido one bone please!');
// 'Throw Fido 1 bone please!'

---

Data Structure
--------------

Use arrays to contain the sentences. Use subarrays within the sentence array to contain each word. 

Use an array to convert "number words" to the appropriate digits.

---

Algorithm
---------

- Initialize an array containing all number words for digits 0 - 9
- Split the input string into an array of sentences (delimiting by periods (.)).
- Split the sentences into individual words (delimiting by spaces).
- Iterate through the words and replace any "number words" with the appropriate number.
- Join the words together with spaces.
- Join the sentences together with periods. Return the result.

Code
----

*/

function wordToDigit(inputStr) {
  const NUMBER_WORDS = ['zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine'];

  let sentences = inputStr.split('.');
  sentences = sentences.map(s => s.split(' '));

  sentences = sentences.map(wordsArr => {
    return wordsArr.map(word => {
      if (NUMBER_WORDS.includes(word.toLowerCase())) {
        return String(NUMBER_WORDS.indexOf(word.toLowerCase()));
      } else {
        return word;
      }
    });
  });

  return sentences.map(s => s.join(' ')).join('.');
}

// LS Solution

// const NUM_WORDS = {
//   zero:  0,
//   one:   1,
//   two:   2,
//   three: 3,
//   four:  4,
//   five:  5,
//   six:   6,
//   seven: 7,
//   eight: 8,
//   nine:  9,
// };

// function wordToDigit(sentence) {
//   Object.keys(NUM_WORDS).forEach(word => {
//     let regex = new RegExp('\\b' + word + '\\b', 'g');
//     sentence = sentence.replace(regex, NUM_WORDS[word]);
//   });

//   return sentence;
// }

console.log(wordToDigit('Please call me at five five five one two three four. Thanks.'));
// "Please call me at 5 5 5 1 2 3 4. Thanks."

console.log(wordToDigit(' zero ZERO zErO oNe. How is it tWo already.'));
// ' 0 0 0 1. How is it 2 already.'

console.log(wordToDigit('zero one two three four five six seven eight nine'));
// '0 1 2 3 4 5 6 7 8 9'

console.log(wordToDigit('Throw Fido one bone please!'));
// 'Throw Fido 1 bone please!'