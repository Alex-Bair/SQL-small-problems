function sum(number) {
  return String(number).split('').map(str => Number(str)).reduce((s, n) => s += n);
}

console.log(sum(23));           // 5
console.log(sum(496));          // 19
console.log(sum(123456789));    // 45