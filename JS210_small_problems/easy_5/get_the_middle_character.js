function centerOf(str) {
  let numberOfChars = (str.length % 2 == 0) ? 2 : 1;
  let middleIndex = (str.length - 1) / 2;
  
  return str.slice(middleIndex, middleIndex + numberOfChars);
}

console.log(centerOf('I Love JavaScript')); // "a"
console.log(centerOf('Launch School'));     // " "
console.log(centerOf('Launch'));            // "un"
console.log(centerOf('Launchschool'));      // "hs"
console.log(centerOf('x'));                 // "x"