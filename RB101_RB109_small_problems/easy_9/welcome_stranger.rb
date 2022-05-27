=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: an array (2+ elements that form a name when combined) and a hash (containing title and occupation)
-  Output: return a greeting that uses person's full name and mentions their title and occupation.

---

**Problem Domain:**
Nothing specific.
---

**Implicit Requirements:**
- Must return greeting.
---

**Clarifying Questions:**

1. Do initials need to have period after them in the name?
  - No, do not add any characters to the name.

---

**Mental Model:**

Concatenate array together to form name. Reference hash in string concatenation when returning greeting.

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
=> Hello, John Q Doe! Nice to have a Master Plumber around.

---

Data Structure
--------------

Use string concatenation to build greeting based on array and hash arguments.

---

Algorithm
---------

- Concatenate array to form name.
- Build string greeting, using name and references to title and occupation in hash argument.

Code
----

=end

def greetings(name_arr, hash)
  name = name_arr.join(" ")
  "Howdy, #{name}! Thank goodness you're a #{hash[:title]} #{hash[:occupation]}; we were just about to go snipe hunting!"
end

p greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
#=> Hello, John Q Doe! Nice to have a Master Plumber around.

#Further Exploration

#To get the line below 80 characters, we could use variables to do the array joining and hash calls. Then reference the variables in the greeting string.
#Alternatively, we could use a YAML file for the non-string concatenation characters. Although that's a little much for a simple program like this.

def greetings(name, status)
  name = name.join(' ')
  title = status[:title]
  occ = status[:occupation]
  
  "Hello, #{name}! Nice to have a #{title} #{occ} around."
end