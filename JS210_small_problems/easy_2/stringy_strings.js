function stringy(num) {
  let string = '';
  let numToConcat = '1';
  let alternateNumToConcat = '0';
  let currentNumToConcat = numToConcat;

  for (let iteration = 1; iteration <= num; iteration += 1) {
    string += currentNumToConcat;
    currentNumToConcat = currentNumToConcat === numToConcat ? alternateNumToConcat : numToConcat;
  }

  console.log(string);
  return string;
}

stringy(6);    // "101010"
stringy(9);    // "101010101"
stringy(4);    // "1010"
stringy(7);    // "1010101"