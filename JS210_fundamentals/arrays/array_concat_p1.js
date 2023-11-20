function concat(array1, secondArgument) {
  let newArray = array1.slice();

  if (Array.isArray(secondArgument)) {
    for (let index = 0; index < secondArgument.length; index += 1) {
      newArray.push(secondArgument[index]);
    }
  } else {
    newArray.push(secondArgument);
  }

  return newArray;
}

function concat(array1, secondArgument) {
  let newArray = array1.slice();

  let array2 = [secondArgument].flat();

  for (let index = 0; index < array2.length; index += 1) {
    newArray.push(array2[index]);
  }

  return newArray;
}

console.log(concat([1, 2, 3], [4, 5, 6]));          // [1, 2, 3, 4, 5, 6]
console.log(concat([1, 2], 3));                     // [1, 2, 3]
console.log(concat([2, 3], ['two', 'three']));      // [2, 3, "two", "three"]
console.log(concat([2, 3], 'four'));                // [2, 3, "four"]


const obj = { a: 2, b: 3 };
const newArray = concat([2, 3], obj);
console.log(newArray);                              // [2, 3, { a: 2, b: 3 }]
obj.a = 'two';
console.log(newArray);                              // [2, 3, { a: "two", b: 3 }]

const arr1 = [1, 2, 3];
const arr2 = [4, 5, obj];
const arr3 = concat(arr1, arr2);
console.log(arr3);                                  // [1, 2, 3, 4, 5, { a: "two", b: 3 }]
obj.b = 'three';
console.log(arr3);                                  // [1, 2, 3, 4, 5, { a: "two", b: "three" }]

arr3[5].b = 3;                                      // or, `arr3[5]['b'] = 3;`
console.log(obj);                                   // { a: "two", b: 3 }