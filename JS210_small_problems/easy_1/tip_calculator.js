const RL_SYNC = require('readline-sync');

let billAmount = Number(RL_SYNC.question('What is the bill? '));
let tipPercent = Number(RL_SYNC.question('Wat is the tip percentage? '));

let tip = billAmount * tipPercent / 100;
let total = billAmount + tip;

console.log(`The tip is $${tip.toFixed(2)}.`);
console.log(`The total is $${total.toFixed(2)}`);