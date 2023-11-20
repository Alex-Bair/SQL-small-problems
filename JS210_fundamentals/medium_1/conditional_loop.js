let i = 0;
while (i < 10) {
  if (i % 3 === 0) {
    console.log(i);
  } else {
    i += 1;
  }
}

// The above code does NOT log each number between 0 and 9 that is a multiple of 3. This is because we only increment variable i when it is NOT a multiple of 3 (i.e. only in the else clause). Because of this, we'll enter an infinite loop that continually outputs 0.