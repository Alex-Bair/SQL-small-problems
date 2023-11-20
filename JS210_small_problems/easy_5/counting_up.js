function sequence(num) {
  let arr = [];

  for (let iteration = 1; iteration <= num; iteration += 1) {
    arr.push(iteration);
  }

  return arr;
}

sequence(5);    // [1, 2, 3, 4, 5]
sequence(3);    // [1, 2, 3]
sequence(1);    // [1]