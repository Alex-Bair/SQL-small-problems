=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: string
-  Output: new string with stagered capitalization

---

**Problem Domain:**
Nothing specific.
---

**Implicit Requirements:**
- New strings should start with a capitalized character.
- Non-letter characters should not be modified, but they should be counted as characters when switching between uppercase and lowercase.
---

**Clarifying Questions:**

1. Should leading spaces be maintained?
  - Yes, do not trim leading spaces on the string.
---

**Mental Model:**

- Capitalize or lowercase the characters based on their index (odd = lowercase, even = capitalized)

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
staggered_case('ALL_CAPS') == 'AlL_CaPs'
staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

---

Data Structure
--------------

- Use arrays to store and manipulate data.

---

Algorithm
---------

- Split input string into an array1 of each character.
- Destructively transform array1
  - If index is odd, downcase the character.
  - If index is even, upcase the character.
- Join the transformed array together.

Code
----

=end

def staggered_case(string)
  arr = string.chars.map.with_index do |element, index|
    if index.even?
      element.upcase
    else
      element.downcase
    end
  end

  arr.join
end

#Further Exploration

#Downcase can start the string if the start_with_upcase is passed false in the method call.

def staggered_case(string, start_with_upcase= true)
  result = ''
  need_upper = start_with_upcase
  string.chars.each do |char|
    if need_upper
      result += char.upcase
    else
      result += char.downcase
    end
    need_upper = !need_upper
  end
  result
end

p staggered_case('I Love Launch School!', false)
p staggered_case('ALL_CAPS', false)
p staggered_case('ignore 77 the 444 numbers', false)