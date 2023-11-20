function generateRandomInteger(lowerLimit, upperLimit) {
  let difference = upperLimit - lowerLimit + 1;
  let age = Math.floor(Math.random() * difference + lowerLimit);
  return age;
}

let string = `Teddy is ${generateRandomInteger(20, 200)} years old!`;

console.log(string);

// Further Exploration

function generateRandomInteger(lowerLimit, upperLimit) {
  if (lowerLimit > upperLimit) {
    [lowerLimit, upperLimit] = [upperLimit, lowerLimit];
  }
  let difference = upperLimit - lowerLimit + 1;
  let age = Math.floor(Math.random() * difference + lowerLimit);
  return age;
}