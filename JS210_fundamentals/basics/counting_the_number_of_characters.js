// const readlineSync = require('readline-sync');

// let phrase = readlineSync.question('Please enter a phrase: ');

// console.log(`There are ${phrase.length} characters in "${phrase}".`);

// Further Exploration - not counting spaces

// const readlineSync = require('readline-sync');

// let phrase = readlineSync.question('Please enter a phrase: ');

// let noSpacesPhrase = phrase.replace(/ /g, '');

// console.log(`There are ${noSpacesPhrase.length} non-space characters in "${phrase}".`);

// Further further exploration - only count alphabetic characters

const readlineSync = require('readline-sync');

let phrase = readlineSync.question('Please enter a phrase: ');

let onlyAlphabetPhrase = phrase.replace(/[^A-Za-z]/g, '');

console.log(`There are ${onlyAlphabetPhrase.length} non-space characters in "${phrase}".`);