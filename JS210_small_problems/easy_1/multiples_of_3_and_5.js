function multisum(inputNum) {
  let numbers = [];

  for (let num = 1; num <= inputNum; num += 1) {
    if (num % 3 === 0 || num % 5 === 0) {
      numbers.push(num);
    }
  }

  let sum = numbers.reduce((acc, element) => acc += element, 0);

  return sum;
}

console.log(multisum(3));       // 3
console.log(multisum(5));       // 8
console.log(multisum(10));      // 33
console.log(multisum(1000));    // 234168