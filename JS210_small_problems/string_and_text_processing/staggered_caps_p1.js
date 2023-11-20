function staggeredCase(str) {
  const TWO_CHARACTERS_REGEX = /(.)(.)/g;

  return str.replace(TWO_CHARACTERS_REGEX, (_, c1, c2) => (c1.toUpperCase() + c2.toLowerCase()));
}

console.log(staggeredCase('I Love Launch School!'));        // "I LoVe lAuNcH ScHoOl!"
console.log(staggeredCase('ALL_CAPS'));                     // "AlL_CaPs"
console.log(staggeredCase('ignore 77 the 4444 numbers'));   // "IgNoRe 77 ThE 4444 nUmBeRs"