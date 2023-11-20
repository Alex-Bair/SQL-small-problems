const myBoolean = true;
const myString = 'hello';
const myArray = [];
const myOtherString = '';

if (myBoolean) {
  console.log('Hello'); // Hello - myBoolean evaluates to true
}

if (!myString) {
  console.log('World'); // nothing will be logged to the console (!myString evaluated to false)
}

if (!!myArray) {
  console.log('World'); // World - !!myArray evalutes to true
}

if (myOtherString || myArray) {
  console.log('!'); // ! - myOtherString evaluates to false, but myArray evaluates to true
}