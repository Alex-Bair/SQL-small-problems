const myName = 'Bob';
const saveName = myName;
myName.toUpperCase();
console.log(myName, saveName); // Bob Bob

// Strings are primitive values, meaning they cannot be mutated. myName.toUpperCase() returns an uppercased version of myName's value ('BOB'), but myName is never reassigned to the newly returned value.
// This means on line 4, both myName and saveName are still pointing to strings with values 'Bob'