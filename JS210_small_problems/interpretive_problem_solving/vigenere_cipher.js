/*

The Vigenere Cipher encrypts alphabetic text using polyalphabetic substitution. It uses a series of Caesar Ciphers based on the letters of a keyword. Each letter of the keyword is treated as a shift value. For instance, the letter 'B' corresponds to a shift value of 1, and the letter 'd' corresponds to a shift value of 3. In other words, the shift value used for a letter is equal to its index value in the alphabet. This means that the letters 'a'-'z' are equivalent to the numbers 0-25. The uppercase letters 'A'-'Z' are also equivalent to 0-25.

Applying the Vigenere Cipher is done sequentially for each character by applying the current shift value to a Caesar Cipher for that particular character. To make this more concrete, let's look at the following example:

Copy Code
plaintext: Pineapples don't go on pizzas!
keyword: meat

Applying the Vigenere Cipher for each alphabetic character:
plaintext : Pine appl esdo ntgo onpi zzas
shift     : meat meat meat meat meat meat
ciphertext: Bmnx mtpe qwdh zxgh arpb ldal

result: Bmnxmtpeqw dhz'x gh ar pbldal!
Notice that in the example, the key isn't moved forward if the character isn't in the alphabet. Like the Caesar Cipher, the Vigenere Cipher only encrypts alphabetic characters.

Write a function that implements the Vigenere Cipher. The case of the keyword doesn't matter—in other words, the resulting encryption won't change depending on the case of the keyword's letters (e.g., 'MEat' === 'mEaT').

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: two strings. The first is the plaintext to be encrypted. The second is a "keyword" that is used to encrypt the plaintext.
-  Output: return a string that is the encrypted version of the plaintext input string

---

**Problem Domain:**

The Vigenere Cipher applies the Caesar cipher to the plaintext. 

The "key" number for the encryption is determined by the "keyword". 

Each letter in the key word represents it's index in the alphabet (i.e. 'a' is 0, 'b' is 1, etc.). Letter cases do not matter for the keyword.

Ex: keyword 'abc' means that the Ceasar cipher should be applied to the letter characters in the input using a key following the pattern 1, 2, 3 until the entire plaintext is encrypted.

The Vigenere Cipher only encrypts alphabetic characters.

---

**Explicit Requirements:**
- Input is two strings - the plaintext and the keyword.
- Output should be the encrypted plaintext as a string.
- Case of the plaintext should be maintained in the encrypted text.
- The encrypted text should be returned.
- For the keyword:
  - Case does not matter
  - Each letter represents a shift value that is the index of the letter in the alphabet (i.e. 'a' is 0, 'b' is 1, etc.)
  - The Caesar cipher is applied to the characters of the plaintext, using a single shift value from the keyword.
    - The shift value used is the next one in line in the keyword.
      - Once we reach the end of the shift values, we repeat the same sequence until the plaintext is encrypted.
---


**Implicit Requirements:**
- None that I can see.
---

**Clarifying Questions:**

1. Can we use the caesarEncrypt method we created from the previous lesson in this solution?
  Yes.
2. Can we assume that the inputs will always be non-empty strings that contain at least one letter?
  Yes.
3. How should non-letter characters in the keywords be handled?
  Ignore any non-letter characterrs in the keyword.
4. If the plaintext is shorter than the keyword, do we ignore the part of the keyword that exceed the plaintext's length?
  Yes.

---

**Mental Model:**

- Remove all non-letter characters from keyword. Convert them to all lowercased letters.
- Split the keyword letters into an array of characters. Map them to their associated indexes in the alphabet.
- Initialize a variable `currentKeyIndex` to 0;

- Split the plaintext into an array of characters. Transform it:
  - If the character is not a letter, return the character.
  - If the character is a letter:
    - Save the result of using the caesar cipher on the character with the key at the currentKeyIndex index.
    - Increment the currentKeyIndex index by 1.
    - If there is no key at the currentKeyIndex index in the keyword key array,
      - Reassign currentKeyIndex to 0. (i.e. start at the beginning of the array again)
    - Return the saved result.
- Join the encrypted plaintext characters together and return the resulting string.

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

encryptVigenere("Pineapples don't go on pizzas!", "meat") // "Bmnxmtpeqw dhz'x gh ar pbldal!"
encryptVigenere("dog", "cat") // "foz"
encryptVigenere("DOG", "cat") // "FOZ"
encryptVigenere("dog", "CAT") // "foz"
encryptVigenere("DOG", "CAT") // "foz"
encryptVigenere("dog", "  &8 _+ca!t^^") // "foz"
encryptVigenere("dog", "a") // "dog"
encryptVigenere("dog", "cattytytyty") // "foz"
encryptVigenere("dog!&$", "cat") // "foz!&%"
encryptVigenere("", "cat") // ''

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

Use an array to contain the keys, like:
[1, 2, 3]

Use an array to contain the characters in the plaintext.

---

Algorithm
---------

- Remove all non-letter characters from keyword. Convert them to all lowercased letters.
- Split the keyword letters into an array of characters. Map them to their associated indexes in the alphabet.
- Initialize a variable `currentKeyIndex` to 0;

- Split the plaintext into an array of characters. Transform it:
  - If the character is not a letter, return the character.
  - If the character is a letter:
    - Save the result of using the caesar cipher on the character with the key at the currentKeyIndex index.
    - Increment the currentKeyIndex index by 1.
    - If there is no key at the currentKeyIndex index in the keyword key array,
      - Reassign currentKeyIndex to 0. (i.e. start at the beginning of the array again)
    - Return the saved result.
- Join the encrypted plaintext characters together and return the resulting string.

Code
----
*/

function encryptVigenere(plaintext, keyword) {
  let keys = convertKeywordToKeys(keyword);

  let currentKeyIndex = 0;

  let encryptedChars = plaintext.split('').map(char => {
    if (/[^a-z]/i.test(char)) return char;

    let key = keys[currentKeyIndex];

    let encryptedChar = caesarEncrypt(char, key);

    currentKeyIndex += 1;

    if (keys[currentKeyIndex] === undefined) {
      currentKeyIndex = 0;
    }

    return encryptedChar;
  });

  console.log(encryptedChars.join(''));
  return encryptedChars.join('');
}

function convertKeywordToKeys(keyword) {
  const UPPERCASE_ALPHABET = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.split('');
  keyword = keyword.replaceAll(/[^a-z]/ig, '');
  return keyword.split('').map(letter => UPPERCASE_ALPHABET.indexOf(letter.toUpperCase()));
}

// LS caesarEncrypt solution from last problem

function caesarEncrypt(plaintext, key) {
  let ciphertext = '';

  plaintext.split('').forEach(char => {
    if (char >= 'A' && char <= 'Z') {
      ciphertext += encrypt(char, key, 'upper');
    } else if (char >= 'a' && char <= 'z') {
      ciphertext += encrypt(char, key, 'lower');
    } else {
      ciphertext += char;
    }
  });

  return ciphertext;
}

function encrypt(letter, key, letterCase) {
  const base = letterCase === 'upper' ? 65 : 97;
  const charCode = letter.charCodeAt(0) - base;
  const shifted = (charCode + key) % 26;

  return String.fromCharCode(shifted + base);
}

encryptVigenere("Pineapples don't go on pizzas!", "meat") // "Bmnxmtpeqw dhz'x gh ar pbldal!"
encryptVigenere("dog", "cat") // "foz"
encryptVigenere("DOG", "cat") // "FOZ"
encryptVigenere("dog", "CAT") // "foz"
encryptVigenere("DOG", "CAT") // "FOZ"
encryptVigenere("dog", "  &8 _+ca!t^^") // "foz"
encryptVigenere("dog", "a") // "dog"
encryptVigenere("dog", "cattytytyty") // "foz"
encryptVigenere("dog!&$", "cat") // "foz!&%"
encryptVigenere("", "cat") // ''