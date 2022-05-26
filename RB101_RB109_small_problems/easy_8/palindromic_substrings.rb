=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: string
-  Output: array of all substrings that are palindromic

---

**Problem Domain:**
Palindromes are strings that are the same forwards and backwards.
---

**Implicit Requirements:**
- Use #substrings method from previous exercise.
- Return values should be arranges in same sequence as the substrings appear.
- Duplicate palindromes should be maintained.
- Palindromes are case specific.
- Single characters are not palindromes.
---

**Clarifying Questions:**

1.

---

**Mental Model:**

- Generate all substrings of the input string.
- Select which substrings are the same forwards as backwards (or reversed).

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

palindromes('abcd') == []
palindromes('madam') == ['madam', 'ada']
palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]

---

Data Structure
--------------

- Use arrays to store substrings and iterate over for selection.

---

Algorithm
---------

- Get all substrings within input string using previous exercises #substrings method.
- Perform selection on the array of substrings
  - Only select those substrings that are greater than 1 character and the same forwards as backwards
- Return selection array.

Code
----

=end

def leading_substrings(string)
  result = []
  0.upto(string.size - 1) do |index|
    result << string[0..index]
  end
  result
end

def substrings(string)
  all_substrings = []
  string.length.times do |index|
    all_substrings += leading_substrings(string[index..-1])
  end
  all_substrings
end

def palindrome?(string)
  (string.length > 1) && (string == string.reverse)
end

def palindromes(string)
  substrings(string).select do |substring|
    palindrome?(substring)
  end
end

#Further Exploration - ignore non-alphanumeric characters and case.

def remove_non_alphanumeric(string)
  string.delete("^0-9A-Za-z")
end

def palindrome?(string)
  string = remove_non_alphanumeric(string).downcase
  (string.length > 1) && (string == string.reverse)
end