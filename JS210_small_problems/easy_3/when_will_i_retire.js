let rlSync = require('readline-sync');

let age = Number.parseInt(rlSync.question('What is your age? '), 10);
let retirementAge = Number.parseInt(rlSync.question('At what age would you like to retire? '), 10);

let currentYear = new Date().getFullYear();
let retirementYear = currentYear + (retirementAge - age);

console.log(`It's ${currentYear}. You will retire in ${retirementYear}.`);
console.log(`You have only ${retirementYear - currentYear} years of work to go!`);