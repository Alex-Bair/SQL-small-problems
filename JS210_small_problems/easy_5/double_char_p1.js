function repeater(str) {
  let doubledCharString = '';

  for (let char of str) {
    doubledCharString += char.repeat(2);
  }

  return doubledCharString;
}

console.log(repeater('Hello'));        // "HHeelllloo"
console.log(repeater('Good job!'));    // "GGoooodd  jjoobb!!"
console.log(repeater(''));             // ""