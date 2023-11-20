const rlSync = require('readline-sync');

let firstNumber = parseInt(rlSync.question('==> Enter the first number: \n'), 10);
let secondNumber = parseInt(rlSync.question('==> Enter the second number: \n'), 10);

console.log(`${firstNumber} + ${secondNumber} = ${firstNumber + secondNumber}`);
console.log(`${firstNumber} - ${secondNumber} = ${firstNumber - secondNumber}`);
console.log(`${firstNumber} * ${secondNumber} = ${firstNumber * secondNumber}`);
console.log(`${firstNumber} / ${secondNumber} = ${parseInt(firstNumber / secondNumber, 10)}`);
console.log(`${firstNumber} % ${secondNumber} = ${firstNumber % secondNumber}`);
console.log(`${firstNumber} ** ${secondNumber} = ${firstNumber ** secondNumber}`);