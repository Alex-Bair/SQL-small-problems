=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: text file
-  Output: print out:
                longest sentence in the file based on number of words.
                number of words in the longest sentence

---

**Problem Domain:**
Sentences may end with periods (.), exclamation points (!) or question marks (?).
Any sequence of characters that are not spaces or sentence-ending characters should be treated as a word.
---

**Explicit Requirements:**
- Print the longest sentence in the input text.
- Print the number of words in the longest sentence.
---


**Implicit Requirements:**
- None.
---

**Clarifying Questions:**

1. Should the input text be mutated?
  No.

---

**Mental Model:**

Convert all sentence ending characters into a single type (ex: change ! and ? into .) Split the text into sentences based on the single type of sentence ending words remaining. 
Determine the longest sentence based on word count. Output the sentence and the word count.

---

Data Structure
--------------

Use an array to contain the sentences
[sentence 1, sentence 2, etc.]

Use arrays to contain the words in each sentence
[word 1, word 2, word 3, etc.]

---

Algorithm
---------

- Intialize variable 'text' to the input text.
- Substitute all '!' and '?' to '.' in 'text'. Assign to variable 'text'.
- Split 'text' into an array of sentences by delimiting on '.' . Assign to variable 'sentences'.
- Iterate over 'sentences' and get the maximum length sentence by the word count. Assign return value to 'longest_sentence'.
  - Word count can be determined by splitting sentence into an array of words delimiting by spaces and counting the number of elements.
- Assign 'number_of_words' to the number of words in 'longest_sentence' by delimiting by spaces.
- Output 'longest_sentence' and the 'number_of_words'


Code
----

=end

def find_longest_sentence(text)
  text = text.gsub('!', '.').gsub('?', '.')
  sentences = text.split('.')
  longest_sentence = sentences.max_by do |sentence|
    sentence.split(' ').size
  end
  word_count = longest_sentence.split(' ').size
  puts "The longest sentence with #{word_count} words is:"
  puts longest_sentence + '.'
end

text = File.read('frankenstein.txt')

find_longest_sentence(text)