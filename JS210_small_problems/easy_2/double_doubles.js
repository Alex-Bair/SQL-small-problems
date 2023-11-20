function isDoubleNumber(num) {
  let fullString = num.toString();
  let halfString = fullString.substr(0, fullString.length / 2);
  return fullString === halfString.repeat(2);
}

function twice(num) {
  return isDoubleNumber(num) ? num : num * 2;
}


console.log(twice(37));          // 74
console.log((44));               // 44
console.log(twice(334433));      // 668866
console.log(twice(444));         // 888
console.log(twice(107));         // 214
console.log(twice(103103));      // 103103
console.log(twice(3333));        // 3333
console.log(twice(7676));        // 7676