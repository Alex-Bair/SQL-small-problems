=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: array of integers between 0 - 19
-  Output: array of integers sorted based on English words for each number

---

**Problem Domain:**
English words for integers means: 
2 = two
3 = three
11 = eleven
etc...
---

**Implicit Requirements:**
- The sorted array must be the integers themselves, not the English words.
- Sort must be in alphabetical order based on the English words.
---

**Clarifying Questions:**

1. None, example makes requirements clear.
2. Should the returned array be a new array or the same array as the input?
  - Assume a new array should be returned.

---

**Mental Model:**

- Create hash1 with the integers 0-19 as keys and their English words as their corresponding values.
- Sort the input array:
  - Sort based on the corresponding hash1 value for the integer key.
  - Sort must be alphabetical order.
- Return the sorted array.

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]

---

Data Structure
--------------

- Use a hash to contain the English words for each integer.
- Use arrays to do sorting.

---

Algorithm
---------

- Create hash1 with the integers 0-19 as keys and their English words as their corresponding values.
- Sort the input array:
  - Sort based on the corresponding hash1 value for the integer key.
  - Sort must be alphabetical order.
- Return the sorted array.

Code
----

=end

WORDS_FOR_NUMBERS = {
  0 => "zero",
  1 => "one",
  2 => "two",
  3 => "three",
  4 => "four",
  5 => "five",
  6 => "six",
  7 => "seven",
  8 => "eight",
  9 => "nine",
  10 => "ten",
  11 => "eleven",
  12 => "twelve",
  13 => "thirteen",
  14 => "fourteen",
  15 => "fifteen",
  16 => "sixtenn",
  17 => "seventeen",
  18 => "eighteen",
  19 => "nineteen"
}

def alphabetic_number_sort(integer_arr)
  integer_arr.sort_by {|num| WORDS_FOR_NUMBERS[num]}
end

p alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]

#LS Solution used an array instead of a hash. Makes more sense since an array starts at index 0.

NUMBER_WORDS = %w(zero one two three four five six seven eight nine ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen)

def alphabetic_number_sort(numbers)
  numbers.sort_by {|number| NUMBER_WORDS[number]}
end


#Further Exploration

#We didn't use Array#sort_by! because we did not want to mutate the input array.

def alphabetic_number_sort(numbers)
  numbers.sort {|number1, number2| NUMBER_WORDS[number1] <=> NUMBER_WORDS[number2]}
end

p alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]