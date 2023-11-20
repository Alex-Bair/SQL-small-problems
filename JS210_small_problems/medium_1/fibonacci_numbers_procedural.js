"use strict";


function fibonacci(n) {
  let previousFibNum = 1;
  let currentFibNum = 1;

  for (let index = 3; index <= n; index += 1) {
    [previousFibNum, currentFibNum] = [currentFibNum, previousFibNum + currentFibNum];
  }

  return currentFibNum;
}

console.log(fibonacci(20));       // 6765
console.log(fibonacci(50));       // 12586269025
console.log(fibonacci(75));       // 2111485077978050