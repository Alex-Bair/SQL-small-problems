function alphabeticNumberSort(arr) {
  return [...arr].sort(compareByEnglishWord);
}

function getEnglishWordForNumber(num) {
  const letters = [ 'zero',
                    'one',
                    'two',
                    'three',
                    'four',
                    'five',
                    'six',
                    'seven',
                    'eight',
                    'nine',
                    'ten',
                    'eleven',
                    'twelve',
                    'thirteen',
                    'fourteen',
                    'fifteen',
                    'sixteen',
                    'seventeen',
                    'eighteen',
                    'nineteen', 
                  ];

  return letters[num];
}

function compareByEnglishWord(num1, num2) {
  let englishNum1 = getEnglishWordForNumber(num1);
  let englishNum2 = getEnglishWordForNumber(num2);

  if (englishNum1 < englishNum2) {
    return -1;
  } else if (englishNum1 > englishNum2) {
    return 1;
  } else {
    return 0;
  }
}

console.log(alphabeticNumberSort(
   [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19]));
// [8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17, 6, 16, 10, 13, 3, 12, 2, 0]