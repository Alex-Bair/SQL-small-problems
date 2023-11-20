// const person = { name: 'Victor' };
// const otherPerson = { name: 'Victor' };

// console.log(person === otherPerson);    // false -- expected: true

/*
The above code does not log the expected result because the === operator will check if the two operands are the same object. Although the objects referenced by variables person and otherPerson have the same properties and property values, they are separate, distinct objects.
Since they are different objects, the comparison with === will return false.

The code below is refactored to perform the desired comparison of the object's properties.
*/

const person = { name: 'Victor' };
const otherPerson = person;

console.log(person === otherPerson);    // false -- expected: true
