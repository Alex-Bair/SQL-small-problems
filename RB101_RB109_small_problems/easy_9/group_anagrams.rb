=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: array below

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

-  Output: print out of groups (arrays) of words that are anagrams

---

**Problem Domain:**

Anagrams are words that have the same exact letters in them but in a different order.

---

**Implicit Requirements:**

- Groups of anagrams should be outputted on different lines.
- A single grouping should be encompassed within an array.

---

**Clarifying Questions:**

1. Should the anagram groups be presented in a certain way?
  - No, no specific grouping sequence required.
2. Should groups of single strings be outputted?
  - No, a single string in a group means that there are no anagrams of that string.
3. Should the input array be mutated?
  - No, do not mutate the input array.

---

**Mental Model:**

- Transform the the input array:
  - Select only words from the input array that have the same letters as the current element. Place each word in a separate array.
  - Result of transformation should be an array of nested arrays.
- Select from the transformed array only those subarrays that are unique and contain more than one element.
- Iterate over the selected subarrays and print the subarrays to the screen on separate lines.

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

Input:
words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']
          
Output: 
["demo", "dome", "mode"]
["neon", "none"]
#(etc)

---

Data Structure
--------------

- Use nested arrays to contain groups of anagrams.

---

Algorithm
---------

- Transform the the input array:
  - Select only words from the input array that have the same letters as the current element. 
    - Determine if words have the same letters by deleting all letters in outer iteration element from the current inner iteration element. If the resulting string is empty, then select the innter iteration element (it's an anagram).
    - Place each word in a separate array.
  - Result of transformation should be an array of nested arrays.
- Select from the transformed array only those subarrays that are unique and contain more than one element.
- Iterate over the selected subarrays and print the subarrays to the screen on separate lines.

Code
----

=end

def anagrams(arr)
  anagrams_list = arr.map do |word1|
                    arr.select do |word2|
                      word2.delete(word1).empty?
                    end
                  end

  p anagrams_list

  anagrams_list.uniq!.select! {|subarray| subarray.size > 1}

  anagrams_list.each do |anagrams| 
    p anagrams
  end
end

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon', 'xylo']

anagrams(words)

#Self-instigated Further Exploration

#LS Solution is likely better performance-wise since it does not create multiple duplicate arrays, like my solution does.

result = {}

words.each do |word|
  key = word.split('').sort.join
  if result.has_key?(key)
    result[key].push(word)
  else
    result[key] = [word]
  end
end

result.each_value do |v|
  puts "------"
  p v
end