function century(year) {
  let centuryNumber = Math.ceil(year / 100).toString();
  let suffix;
  
  if (centuryNumber.at(-2) === '1') {
    suffix = 'th';
  } else if (centuryNumber.at(-1) == '1') {
    suffix = 'st';
  } else if (centuryNumber.at(-1) === '2') {
    suffix = 'nd';
  } else if (centuryNumber.at(-1) === '3') {
    suffix = 'rd';
  } else {
    suffix = 'th';
  }
  
  return centuryNumber + suffix;
}

console.log(century(2000));        // "20th"
console.log(century(2001));        // "21st"
console.log(century(1965));        // "20th"
console.log(century(256));         // "3rd"
console.log(century(5));           // "1st"
console.log(century(10103));       // "102nd"
console.log(century(1052));        // "11th"
console.log(century(1127));        // "12th"
console.log(century(11201));       // "113th"