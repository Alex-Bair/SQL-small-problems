function wordSizes(inputStr) {
  if (inputStr === '') {
    return {};
  }

  let words = inputStr.split(' ');

  return words.reduce(function(count, word) {
    let size = word.length;
    if (!count[size]) {
      count[size] = 1;
    } else {
      count[size] += 1;
    }

    return count;
  }, {});
}


console.log(wordSizes('Four score and seven.'));                       // { "3": 1, "4": 1, "5": 1, "6": 1 }
console.log(wordSizes('Hey diddle diddle, the cat and the fiddle!'));  // { "3": 5, "6": 1, "7": 2 }
console.log(wordSizes("What's up doc?"));                              // { "2": 1, "4": 1, "6": 1 }
console.log(wordSizes(''));                                            // {}