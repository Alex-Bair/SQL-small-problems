// const RL_SYNC = require('readline-sync');

// const SQMETERS_TO_SQFEET = 10.7639;


// console.log('Enter the length of the room in meters: ');
// let length = Number(RL_SYNC.prompt());

// console.log('Enter the width of the room in meters: ');
// let width = Number(RL_SYNC.prompt());

// let area = (length * width).toFixed(2);

// let message = `The area of the room is ${area} square meters (${(area * SQMETERS_TO_SQFEET).toFixed(2)} square feet).`;

// console.log(message);

// Further Exploration

const RL_SYNC = require('readline-sync');

const SQMETERS_TO_SQFEET = 10.7639;

console.log('Choose "feet" or "meters" as the unit: ');
let unit = RL_SYNC.prompt();

console.log('Enter the length of the room: ');
let length = Number(RL_SYNC.prompt());

console.log('Enter the width of the room: ');
let width = Number(RL_SYNC.prompt());

let areaSqFeet;
let areaSqMeters;

if (unit === 'feet') {
  areaSqFeet = length * width;
  areaSqMeters = areaSqFeet / SQMETERS_TO_SQFEET;
} else {
  areaSqMeters = length * width;
  areaSqFeet = areaSqMeters * SQMETERS_TO_SQFEET;
}

let message = `The area of the room is ${areaSqMeters.toFixed(2)} square meters (${areaSqFeet.toFixed(2)} square feet).`;

console.log(message);