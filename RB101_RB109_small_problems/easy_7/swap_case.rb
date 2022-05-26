=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: string
-  Output: new string with uppercase letters swapped with lowercase letters, and vice versa

---

**Problem Domain:**
Nothing specific.
---

**Implicit Requirements:**
- Do not use String#swapcase
- All non-letter characters should remain unchanged.
---

**Clarifying Questions:**

1. None, examples make requirements clear.

---

**Mental Model:**

- Iterate through string. Determine whether a character is lowercase or uppercase letter. If so, switch the case. If not, do nothing.

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

swapcase('CamelCase') == 'cAMELcASE'
swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'

---

Data Structure
--------------

-Use strings.

---

Algorithm
---------

- Iterate through string.
  - If current character is lowercase, capitalize character.
  - If current character is uppercase, lowercase character.
  - If none of the above, do nothing to the character.
- Return new string.

Code
----

=end

def lowercase?(char)
  !! (char =~ /[a-z]/)
end

def uppercase?(char)
  !! (char =~ /[A-Z]/)
end

def swapcase(string)
  swapcase_string = ""

  string.each_char do |char|
    if lowercase?(char)
      swapcase_string << char.upcase
    elsif uppercase?(char)
      swapcase_string << char.downcase
    else
      swapcase_string << char
    end
  end

  swapcase_string
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'