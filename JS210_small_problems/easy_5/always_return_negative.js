function negative(num) {
  return -Math.abs(num);
}

console.log(negative(5));     // -5
console.log(negative(-3));    // -3
console.log(negative(0));     // -0

// Further Exploration

function negative(num) {
  num = num >= 0 ? -num : num;
  return num;
}