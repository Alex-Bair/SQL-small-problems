let myArray = [1, 2, 3, 4];
const myOtherArray = myArray.slice();
// const myOtherArray = myArray.concat([]);

myArray.pop();
console.log(myOtherArray);

myArray = [1, 2];
console.log(myOtherArray);