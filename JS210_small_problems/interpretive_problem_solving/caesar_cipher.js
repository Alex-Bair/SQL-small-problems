/*

Write a function that implements the Caesar Cipher. The Caesar Cipher is one of the earliest and simplest ways to encrypt plaintext so that a message can be transmitted securely. It is a substitution cipher in which each letter in a plaintext is substituted by the letter located a given number of positions away in the alphabet. For example, if the letter 'A' is right-shifted by 3 positions, it will be substituted with the letter 'D'. This shift value is often referred to as the key. The "encrypted plaintext" (ciphertext) can be decoded using this key value.

The Caesar Cipher only encrypts letters (including both lower and upper case). Any other character is left as is. The substituted letters are in the same letter case as the original letter. If the key value for shifting exceeds the length of the alphabet, it wraps around from the beginning.

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: a string to encrypt containing any characters and a "key" that is how many positions to the right that all letters in the input string should be shifted
-  Output: return the encrypted input as a string

---

**Problem Domain:**

The Caesar Cipher right-shifts letters a specified number of positions (given by the key number). Non-letters are left as is. Letter case is preserved.

If the `key` number value for shifting exceeds the length of the alphabet, it wraps around from the beginning.

---

**Explicit Requirements:**
- Return value must be a string representing the encrypted input string
- Letter case must be preserved.
- Letters are right shifted the number of positions specified by the `key` number.
- Non-letters are left as is.
---


**Implicit Requirements:**
- function must be named caesarEncrypt
---

**Clarifying Questions:**

1. Should we assume the inputs will always be a string and a non-negative integer?
  Yes
2. Is an empty string a valid `plaintext` string?
  Yes.

---

**Mental Model:**

- If the input string is an empty string, return an empty string.
- If the input number is 0, return the input string as is.
- Create arrays containing the uppercased alphabet and the lowercased alphabet.
- Iterate over the characters in the input string. Transform the array
  - If the character is not a letter, return the character.
  - If the character is a letter:
    - Calculate the index of the letter in the appropriate alphabet array. 
    - Determine the shifted index by adding the current index with the key value. If the shifted index is greater than or equal to 26, subtract 26 until it is less than 26.
      - Alternatively, use the remainder of dividing the shifted index by 26.
    - Return the character in the appropriate alphabet array at the shifted index.
- Join the transformed characters array together and return it.
---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

// simple shift
caesarEncrypt('A', 0);       // "A"
caesarEncrypt('A', 3);       // "D"

// wrap around
caesarEncrypt('y', 5);       // "d"
caesarEncrypt('a', 47);      // "v"

// all letters
caesarEncrypt('ABCDEFGHIJKLMNOPQRSTUVWXYZ', 25);
// "ZABCDEFGHIJKLMNOPQRSTUVWXY"
caesarEncrypt('The quick brown fox jumps over the lazy dog!', 5);
// "Ymj vznhp gwtbs ktc ozrux tajw ymj qfed itl!"

// many non-letters
caesarEncrypt('There are, as you can see, many punctuations. Right?; Wrong?', 2);
// "Vjgtg ctg, cu aqw ecp ugg, ocpa rwpevwcvkqpu. Tkijv?; Ytqpi?"

caesarEncrypt('***&&^%$') // '***&&^%$'

---

Data Structure
--------------

Represent the alphabet as an array of characters. Have separeate arrays for uppercase and lowercase.
['A', 'B', 'C', etc...]
['a', 'b', 'c', etc...]

Use an array to contain the characters from the orignal input string.

---

Algorithm
---------

- If the input string is an empty string, return an empty string.
- If the input number is 0, return the input string as is.
- Create arrays containing the uppercased alphabet and the lowercased alphabet.
- Iterate over the characters in the input string. Transform the array
  - If the character is not a letter, return the character.
  - If the character is a letter:
    - Calculate the index of the letter in the appropriate alphabet array. 
    - Determine the shifted index by adding the current index with the key value. If the shifted index is greater than or equal to 26, subtract 26 until it is less than 26.
      - Alternatively, use the remainder of dividing the shifted index by 26.
    - Return the character in the appropriate alphabet array at the shifted index.
- Join the transformed characters array together and return it.

Code
----
*/

function caesarEncrypt(plaintext, key) {
  if (plaintext === '' || key === 0) return plaintext;

  const UPPERCASE_ALPHABET = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.split('');

  let plaintextChars = plaintext.split('');

  let encryptedChars = plaintextChars.map(char => {
    if (char.match(/[^a-z]/i)) return char;

    let index = UPPERCASE_ALPHABET.indexOf(char.toUpperCase());

    let shiftedIndex = (index + key) % 26;

    let encryptedChar = UPPERCASE_ALPHABET[shiftedIndex];

    if (char === char.toLowerCase()) {
      encryptedChar = encryptedChar.toLowerCase();
    }

    return encryptedChar;
  });

  console.log(encryptedChars.join(''));
  return encryptedChars.join('');
}

// simple shift
console.log(caesarEncrypt('', 2));
console.log(caesarEncrypt('A', 0));       // "A"
caesarEncrypt('A', 3);       // "D"

// wrap around
caesarEncrypt('y', 5);       // "d"
caesarEncrypt('a', 47);      // "v"

// all letters
caesarEncrypt('ABCDEFGHIJKLMNOPQRSTUVWXYZ', 25);
// "ZABCDEFGHIJKLMNOPQRSTUVWXY"
caesarEncrypt('The quick brown fox jumps over the lazy dog!', 5);
// "Ymj vznhp gwtbs ktc ozrux tajw ymj qfed itl!"

// many non-letters
caesarEncrypt('There are, as you can see, many punctuations. Right?; Wrong?', 2);
// "Vjgtg ctg, cu aqw ecp ugg, ocpa rwpevwcvkqpu. Tkijv?; Ytqpi?"

caesarEncrypt('***&&^%$'); // '***&&^%$'