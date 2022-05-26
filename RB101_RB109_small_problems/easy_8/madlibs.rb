=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: takes a noun, a verb, an adjective, and an adverb
-  Output: story using the inputs

---

**Problem Domain:**
- Similar to Mad Libs. Inputs given noun, verb, adjective, and adverb into a story template.
---

**Implicit Requirements:**
- Story must use all four inputs.
- Story must make sense.
---

**Clarifying Questions:**

1. Does the story have to be a specified length?
  - No.

---

**Mental Model:**

Get inputs from user.
Output string using the inputs from the user.

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

Enter a noun: dog
Enter a verb: walk
Enter an adjective: blue
Enter an adverb: quickly

Do you walk your blue dog quickly? That's hilarious!

---

Data Structure
--------------

Use strings.

---

Algorithm
---------

- Prompt user for noun. Save as noun.
- Prompt user for verb. Save as verb.
- Prompt user for adjective. Save as adjective.
- Prompt user for adverb. Save as adverb.
- Output string using all four user inputs.

Code
----

=end

def get_input(desired_word)
  if desired_word.start_with?(/a/i, /e/i, /i/i, /o/i, /u/i)
    article = "an"
  else
    article = "a"
  end
  print "Enter #{article} #{desired_word}: "
  gets.chomp
end

noun = get_input("noun")
verb = get_input("verb")
adjective = get_input("adjective")
adverb = get_input("adverb")

puts "Does your #{adjective} #{noun} #{verb} #{adverb}? Really? Mine does too!"