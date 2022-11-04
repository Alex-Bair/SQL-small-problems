=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs:
      - an external text file
      - a selection of random nouns
      - a selection of random verbs
      - a selection of random adjectives
      - a selection of random adverbs

-  Output: print the text from the external text file but with the selected nouns, verbs, adjectives, and adverbs placed into the appropriate spots

---

**Problem Domain:**

Nothing specific.

---

**Explicit Requirements:**

- Text file must be internal.
- Random words from the input nouns, verbs, adjectives, or adverbs should be placed into the output text

---


**Implicit Requirements:**

---

**Clarifying Questions:**

1.
2.
3.

---

**Mental Model:**

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

-  Example 1
  -  Inputs:
  -  Output:
-  Example 2
  -  Inputs:
  -  Output:

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

---

Algorithm
---------

Code
----

=end

text = File.read('madlibs_text.txt')

lines = text.split("\n")

possible_words = {
  '%{noun}' => ['fox', 'dog', 'head', 'leg'],
  '%{verb}' => ['jumps', 'lifts', 'bites', 'licks'],
  '%{adverb}' => ['easily', 'lazily', 'noisily', 'excitedly'],
  '%{adjective}' => ['quick', 'lazy', 'sleepy', 'ugly']
}

possible_words.each do |key, value|
  lines.each do |line|
    line.gsub!(key, value.sample)
  end
end

print lines.join("\n")


#LS Solution
=begin
ADJECTIVES = %w(quick lazy sleepy ugly).freeze
NOUNS      = %w(fox dog head leg cat tail).freeze
VERBS      = %w(spins bites licks hurdles).freeze
ADVERBS    = %w(easily lazily noisly excitedly).freeze

File.open('madlibs_text.txt') do |file|
  file.each do |line|
    puts format(line, noun:      NOUNS.sample,
                      verb:      VERBS.sample,
                      adjective: ADJECTIVES.sample,
                      adverb:    ADVERBS.sample)
  end
end
=end