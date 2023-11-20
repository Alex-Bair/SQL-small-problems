"use strict";
/*

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: a string template
-  Output: return the input template with random nouns, verbs, adjectives, and adverbs placed into the text.

---

**Problem Domain:**

A multiline template in JavaScript can be created with `'s, like so:

`
The sleepy brown cat noisily
licks the sleepy yellow
dog who lazily licks his
tail and looks around.
`

---

**Explicit Requirements:**
- Must take a text template as an input
- Must plug in a selection of random nouns, verbs, adjectives, and adverbs in to the text template and return it.
- The list of nouns, verbs, adjectives, and adverbs can be directly built into the program.
- The quotes in the examples are not actually in the output - they are representing which words were inserted into in the template.
---


**Implicit Requirements:**
- We can use the same word multiple times on the same line.
- We can use the same word across multiple different lines.
- The function name should be 
---

**Clarifying Questions:**

1. Should we log the output text to the console, or just return it?
  Return it.
2. Can the same word be used multiple times in the input text?
  Yes.
3. Will the input text ever be a blank string?
  No.
4. Will the function always be passed a single argument?
  Yes.
5. Is there a maximum or minimum length to the input template?
  The input will never be a blank string. No maximum.

---

**Mental Model:**

- Create arrays containing adjectives, nouns, verbs, and adverbs.
- Create a function that returns a random element from an array.
- Create functions that return a random adjective, noun, verb, or adverb.
- Create the template using `'s across multiple lines. Use ${randomWord} to indicate when we need to replace words in the template.
- Create the #madlibs function
  - Use String.prototype.replace to replace all ${randomWord} in the input template with the return value of the appropriate random adjective, noun, adverb, or verb function.

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

function madlibs(template) {
  // ...
}

// These examples use the following list of replacement texts:
adjectives: quick lazy sleepy noisy hungry
nouns: fox dog head leg tail cat
verbs: jumps lifts bites licks pats
adverbs: easily lazily noisily excitedly
------

madlibs(template1);
// The "sleepy" brown "cat" "noisily"
// "licks" the "sleepy" yellow
// "dog", who "lazily" "licks" his
// "tail" and looks around.

madlibs(template1);
// The "hungry" brown "cat" "lazily"
// "licks" the "noisy" yellow
// "dog", who "lazily" "licks" his
// "leg" and looks around.

madlibs(template2);      // The "fox" "bites" the "dog"'s "tail".

madlibs(template2);      // The "cat" "pats" the "cat"'s "head".

---

Data Structure
--------------

Use separate arrays to contain the nouns, adverbs, verbs, and adjectives, like:

const NOUNS = ['fox', 'dog', 'head', 'leg', 'tail', 'cat'];
const ADJECTIVES = ['quick', 'lazy', 'sleepy', 'noisy', 'hungry'];
const VERBS = ['jumps', 'lifts', 'bites', 'licks', 'pats'];
const ADVERBS = ['easily', 'lazily', 'noisily', 'excitedly'];

Use a multi-line template as the input template.
`
The dog ${}randomAdverb ran.
`

---

Algorithm
---------

- Create arrays containing adjectives, nouns, verbs, and adverbs.

- Create a function that returns a random element from an array.

- Create functions that return a random adjective, noun, verb, or adverb.

- Create the template using `'s across multiple lines. Use ${randomWord} to indicate when we need to replace words in the template.

- Create the #madlibs function
  - Use String.prototype.replace to replace all ${randomWord} in the input template with the return value of the appropriate random adjective, noun, adverb, or verb function.


Code
----

*/

const ADJECTIVES = ['quick', 'lazy', 'sleepy', 'noisy', 'hungry'];
const NOUNS = ['fox', 'dog', 'head', 'leg', 'tail', 'cat'];
const VERBS = ['jumps', 'lifts', 'bites', 'licks', 'pats'];
const ADVERBS = ['easily', 'lazily', 'noisily', 'excitedly'];

function randomElement(arr) {
 let randomIndex = Math.floor(Math.random() * arr.length);
 return arr[randomIndex];
}

function randomAdjective() {
  return randomElement(ADJECTIVES);
}

function randomNoun() {
  return randomElement(NOUNS);
}

function randomVerb() {
  return randomElement(VERBS);
}

function randomAdverb() {
  return randomElement(ADVERBS);
}

const replacementPairs = [
  ['$}{ADJECTIVE', randomAdjective],
  ['$}{NOUN', randomNoun],
  ['$}{VERB', randomVerb],
  ['$}{ADVERB', randomAdverb]
];

let template1 = `
The $}{ADJECTIVE brown $}{NOUN $}{ADVERB
$}{VERB the $}{ADJECTIVE yellow
$}{NOUN, who $}{ADVERB $}{VERB his
$}{NOUN and looks around.
`;

function madlibs(template) {
  replacementPairs.forEach(pair => template = template.replaceAll(pair[0], pair[1]));
  return template;
}

console.log(madlibs(template1));
console.log(madlibs(template1));