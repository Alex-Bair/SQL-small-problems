function staggeredCase(str) {
  const TWO_LETTERS_WITH_OPTIONAL_NONALPHABET_SEPARATORS_REGEX = /([a-z])([^a-z])*([a-z])/ig;

  return str.replace(TWO_LETTERS_WITH_OPTIONAL_NONALPHABET_SEPARATORS_REGEX, (_, char1, p2, char3) => (char1.toUpperCase() + (p2 || '') + char3.toLowerCase()));
}

console.log(staggeredCase('I Love Launch School!'));        // "I lOvE lAuNcH sChOoL!"
console.log(staggeredCase('ALL_CAPS'));                     // "AlL cApS"
console.log(staggeredCase('ignore 77 the 4444 numbers'));   // "IgNoRe 77 ThE 444 nUmBeRs"