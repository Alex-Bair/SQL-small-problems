function isDivisibleBy(denominator, numerator) {
  return numerator % denominator === 0;
}

function isLeapYear(year) {
  if (year < 1752) {
    return isDivisibleBy(4, year);
  }
  
  return isDivisibleBy(400, year) || (isDivisibleBy(4, year) && !isDivisibleBy(100, year));
}

console.log(isLeapYear(2016));      // true
console.log(isLeapYear(2015));      // false
console.log(isLeapYear(2100));      // false
console.log(isLeapYear(2400));      // true
console.log(isLeapYear(240000));    // true
console.log(isLeapYear(240001));    // false
console.log(isLeapYear(2000));      // true
console.log(isLeapYear(1900));      // false
console.log(isLeapYear(1752));      // true
console.log(isLeapYear(1700));      // true
console.log(isLeapYear(1));         // false
console.log(isLeapYear(100));       // true
console.log(isLeapYear(400));       // true