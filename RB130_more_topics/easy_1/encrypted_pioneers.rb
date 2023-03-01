=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: string encrypted with with Rot13
-  Output: unencrypted string

---

**Problem Domain:**
Rot13 stands for 'rotate by 13 places'
Rot13 is a simple letter substitution cypher where the letter is replaced with the letter 13 places after it.
---

**Explicit Requirements:**
- Decipher and print each of the names
---


**Implicit Requirements:**
None.
---

**Clarifying Questions:**

1. Should capitalization be maintained?
  Yes, maintain capitalization.

---

**Mental Model:**

#decipher_with_rot13

Split the input string into an array of individual characters.
Iterate through the array of characters in sequence.
  Convert the character using ROT13 decryption.
Combine characters into string and return new string.


#rot13_single_character

If the input character is uppercase:
  - Check the ord of the input character + 13. 
      - If greater than 90, return the letter represented by the input character's ord - 13.
      - Else, return the letter represented by the input character's ord + 13
Elsif the input character is lowercase: 
  - Check the ord of the input character + 13. 
      - If greater than 122, return the letter represented by the input character's ord - 13.
      - Else, return the letter represented by the input character's ord + 13
Else, return the input character (meaning, it's not a letter.)

#uppercase?

Check if the ordinal of the character is between 65 - 90 inclusive

#lowercase?

Check if the ordinal of the character is between 97 - 122 inclusive

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

None provided.

---

Data Structure
--------------
Use an array to manage the letters.
---

Algorithm
---------

Code
----

=end

UPPERCASE_LETTERS = ('A'..'Z')
LOWERCASE_LETTERS = ('a'..'z')
UPPERCASE_ORDS = ('A'.ord..'Z'.ord)
LOWERCASE_ORDS = ('a'.ord..'z'.ord)


NAMES = [
'Nqn Ybirynpr',
'Tenpr Ubccre',
'Nqryr Tbyqfgvar',
'Nyna Ghevat',
'Puneyrf Onoontr',
'Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv',
'Wbua Ngnanfbss',
'Ybvf Unvog',
'Pynhqr Funaaba',
'Fgrir Wbof',
'Ovyy Tngrf',
'Gvz Orearef-Yrr',
'Fgrir Jbmavnx',
'Xbaenq Mhfr',
'Fve Nagbal Ubner',
'Zneiva Zvafxl',
'Lhxvuveb Zngfhzbgb',
'Unllvz Fybavzfxv',
'Tregehqr Oynapu'].freeze

def uppercase?(letter)
  UPPERCASE_LETTERS.cover?(letter)
end

def lowercase?(letter)
  LOWERCASE_LETTERS.cover?(letter)
end

def convert(letter_ord, range)
  range.cover?(letter_ord + 13) ? letter_ord + 13 : letter_ord - 13
end

def rot13_single_character(letter)
  input_ord = letter.ord
  if uppercase?(letter)
    convert(input_ord, UPPERCASE_ORDS).chr
  elsif lowercase?(letter)
    convert(input_ord, LOWERCASE_ORDS).chr
  else
    letter
  end
end

def decipher_with_rot13(encrypted_str)
  encrypted_str.split('').map do |letter|
    rot13_single_character(letter)
  end.join('')
end

NAMES.each do |name|
  puts decipher_with_rot13(name)
end

#LS Solution

ENCRYPTED_PIONEERS = [
  'Nqn Ybirynpr',
  'Tenpr Ubccre',
  'Nqryr Tbyqfgvar',
  'Nyna Ghevat',
  'Puneyrf Onoontr',
  'Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv',
  'Wbua Ngnanfbss',
  'Ybvf Unvog',
  'Pynhqr Funaaba',
  'Fgrir Wbof',
  'Ovyy Tngrf',
  'Gvz Orearef-Yrr',
  'Fgrir Jbmavnx',
  'Xbaenq Mhfr',
  'Fve Nagbal Ubner',
  'Zneiva Zvafxl',
  'Lhxvuveb Zngfhzbgb',
  'Unllvz Fybavzfxv',
  'Tregehqr Oynapu'
].freeze

def rot13(encrypted_text)
  encrypted_text.each_char.reduce('') do |result, encrypted_char|
    result + decipher_character(encrypted_char)
  end
end

def decipher_character(encrypted_char)
  case encrypted_char
  when 'a'..'m', 'A'..'M' then (encrypted_char.ord + 13).chr
  when 'n'..'z', 'N'..'Z' then (encrypted_char.ord - 13).chr
  else                         encrypted_char
  end
end

ENCRYPTED_PIONEERS.each do |encrypted_name|
  puts rot13(encrypted_name)
end