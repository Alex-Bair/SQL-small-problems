=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: string
-  Output: hash with three entries showing how many lowercase letters, how many uppercase letters, and how many are neither

---

**Problem Domain:**
Nothing specific.
---

**Implicit Requirements:**
- Spaces count as non-letters.
- Empty string should return zero for all hash values.
---

**Clarifying Questions:**

1. None - examples make requirements clear.

---

**Mental Model:**

Compare string to strings of uppercase and lowercase letters. Count how many characters in the string are in each array.
Then take the string length and subtract the number of uppercase and lowercase letters to get the 'neither' count.

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

---

Data Structure
--------------

- Use range, array, and strings to generate constants of lowercase and uppercase letters.
- Use strings methods to count how many lowercase and uppercase letters.
- Store results in a hash.

---

Algorithm
---------

- Create lowercase letters string constant.
- Create uppercase letters string constant.
- Count how many lowercase letters are in input string. Save as lowercase_count.
- Count how many uppercase letters are in input string. Save as uppercase_count.
- Subtract uppercase_count and lowercase_count from the input string length. Save as neither_count.
- Add all three counts to a hash.

Code
----

=end

def letter_case_count(input_string)
  lowercase_count = input_string.count('a-z')
  uppercase_count = input_string.count('A-Z')
  neither_count = input_string.length - lowercase_count - uppercase_count

  {
    lowercase: lowercase_count,
    uppercase: uppercase_count,
    neither: neither_count
  }
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

#Solution from Jacob Taylor
def letter_case_count(string)
  {
    lowercase: string.count('a-z'),
    uppercase: string.count('A-Z'),
    neither: string.count('^A-z')
  }
end

#LS Regex Solution
def letter_case_count(string)
  counts = {}
  characters = string.chars
  counts[:lowercase] = characters.count { |char| char =~ /[a-z]/ }
  counts[:uppercase] = characters.count { |char| char =~ /[A-Z]/ }
  counts[:neither] = characters.count { |char| char =~ /[^A-Za-z]/ }
  counts
end