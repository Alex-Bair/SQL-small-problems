function sequence(count, startNum) {
  let seqArray = [];
  let num = startNum;

  for (let iteration = 1; iteration <= count; iteration += 1) {
    seqArray.push(num);
    num += startNum;
  }

  console.log(seqArray);
  return seqArray;
}

sequence(5, 1);          // [1, 2, 3, 4, 5]
sequence(4, -7);         // [-7, -14, -21, -28]
sequence(3, 0);          // [0, 0, 0]
sequence(0, 1000000);    // []