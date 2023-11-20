function objectsEqual(obj1, obj2) {
  let obj1Keys = Object.keys(obj1).sort();
  let obj2Keys = Object.keys(obj2).sort();

  if (obj1Keys.length !== obj2Keys.length) return false;

  for (let index = 0; index < obj1Keys.length; index += 1) {
    let obj1Key = obj1Keys[index];
    let obj1Value = obj1[obj1Key];
    let obj2Value = obj2[obj1Key];

    if (!obj2Keys.includes(obj1Key) || obj2Value !== obj1Value) {
      return false;
    }
  }

  return true;
}

console.log(objectsEqual({a: 'foo'}, {a: 'foo'}));                      // true
console.log(objectsEqual({a: 'foo', b: 'bar'}, {a: 'foo'}));            // false
console.log(objectsEqual({}, {}));                                      // true
console.log(objectsEqual({a: 'foo', b: undefined}, {a: 'foo', c: 1}));  // false

// LS Solution

function objectsEqual(a, b) {
  if (a === b) {
    return true;
  }

  return (keysMatch(a, b) && valuesMatch(a, b));
}

function keysMatch(a, b) {
  const aKeys = Object.getOwnPropertyNames(a).sort();
  const bKeys = Object.getOwnPropertyNames(b).sort();

  if (aKeys.length !== bKeys.length) {
    return false;
  }

  return aKeys.every((key, index) => key === bKeys[index]);
}

function valuesMatch(a, b) {
  const aKeys = Object.getOwnPropertyNames(a).sort();

  return aKeys.every(key => a[key] === b[key]);
}