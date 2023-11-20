function wordCap(str) {
  const WORD_BOUNDARY_REGEX = /[ ]/g;
  let words = str.split(WORD_BOUNDARY_REGEX);

  return words.map(capitalizeWord).join(' ');
}

function capitalizeWord(word) {
  return word[0].toUpperCase() + word.slice(1).toLowerCase();
}

console.log(wordCap('four score and seven'));       // "Four Score And Seven"
console.log(wordCap('the javaScript language'));    // "The Javascript Language"
console.log(wordCap('this is a "quoted" word'));    // 'This Is A "quoted" Word'