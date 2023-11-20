function wordSizes(inputStr) {
  if (inputStr === '') {
    return {};
  }

  inputStr = inputStr.replace(/[^a-z ]/ig, '');

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

console.log(wordSizes('Four score and seven.'));                       // { "3": 1, "4": 1, "5": 2 }
console.log(wordSizes('Hey diddle diddle, the cat and the fiddle!'));  // { "3": 5, "6": 3 }
console.log(wordSizes("What's up doc?"));                              // { "5": 1, "2": 1, "3": 1 }
console.log(wordSizes(''));                                            // {}