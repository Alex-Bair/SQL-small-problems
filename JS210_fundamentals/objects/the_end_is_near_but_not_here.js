// function penultimate(string) {
//   return string.split(' ')[-2];
// }

// penultimate('last word');                    // expected: "last"
// penultimate('Launch School is great!');      // expected: "is"

// The above penultimate function does not work as intended because it is trying to access the '-2' property's value of the split string - which will never exist. Remember that we cannot use negative integers to access elements from the end of the array.

function penultimate(string) {
  return string.split(' ').at(-2);
}

console.log(penultimate('last word'));                    // expected: "last"
console.log(penultimate('Launch School is great!'));      // expected: "is"