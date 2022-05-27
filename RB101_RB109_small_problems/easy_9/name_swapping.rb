=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: string representing first name, space, and last name
-  Output: string with last name, comma, space, then first name

---

**Problem Domain:**
Nothing specific.
---

**Implicit Requirements:**
- Capitalization must be maintained from original string.
---

**Clarifying Questions:**

1. Should the input string be mutated to create the output string?
  - No, do not mutate the input string object.

---

**Mental Model:**

Split input string into array of first name and last name. 
Reverse the order of the names so last name is index 0.
Join the array together with ", "

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

swap_name('Joe Roberts') == 'Roberts, Joe'

---

Data Structure
--------------

Use arrays to manipulate name strings.

---

Algorithm
---------

- Split input string into array of first name and last name. 
- Reverse the order of the names so last name is index 0.
- Join the array together with ", "

Code
----

=end

def swap_name(names)
  names.split.reverse.join(", ")
end

p swap_name('Joe Roberts') == 'Roberts, Joe'