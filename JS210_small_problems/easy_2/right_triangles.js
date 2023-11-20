function triangle(n) {
  console.log('');

  for (let iteration = 1; iteration <= n; iteration += 1) {
    let numberOfStars = iteration;
    let numberOfSpaces = (n - iteration);

    let line = ' '.repeat(numberOfSpaces) + '*'.repeat(numberOfStars);
    console.log(line);
  }

  console.log('');
}

triangle(9);