function slice(array, begin, end) {
  const extractedValues = [];

  begin = begin > array.length ? array.length : begin;
  end = end > array.length ? array.length : end;

  for (let index = begin; index < end; index += 1) {
    extractedValues.push(array[index]);
  }

  return extractedValues;
}

function splice(array, start, deleteCount, ...elements) {
  start = start > array.length ? array.length : start;
  deleteCount = deleteCount > (array.length - start) ? array.length - start : deleteCount;
  
  let deletedElements = [];

  // delete elements from array
  for (let index = start; index < start + deleteCount; index += 1) {
    deletedElements.push(array[index]);
    array[index] = null;
  }

  let newArrayLength = array.length - deleteCount + elements.length;

  // extend length of array and move elements into later indices if array length will increase
  if (newArrayLength > array.length) {
    for (let index = newArrayLength - 1; index >= start; index -= 1) {
      array[index] = array[index - elements.length];
    }
  }

  // insert elements into appropriate indices
  for (let index = start; index < newArrayLength; index += 1) {
    if (elements.length !== 0) {
      array[index] = elements.shift();
    }
  }

  // reduce array length
  array.length = newArrayLength;

  return deletedElements;
}

console.log(splice([1, 2, 3], 1, 2));              // [2, 3]
console.log(splice([1, 2, 3], 1, 3));              // [2, 3]
console.log(splice([1, 2, 3], 1, 0));              // []
console.log(splice([1, 2, 3], 0, 1));              // [1]
console.log(splice([1, 2, 3], 1, 0, 'a'));         // []

const arr2 = [1, 2, 3];
console.log(splice(arr2, 1, 1, 'two'));             // [2]
//
console.log(arr2);                                  // [1, "two", 3]

const arr3 = [1, 2, 3];
console.log(splice(arr3, 1, 2, 'two', 'three'));    // [2, 3]
console.log(arr3);                                  // [1, "two", "three"]

const arr4 = [1, 2, 3];
console.log(splice(arr4, 1, 0));                    // []
console.log(splice(arr4, 1, 0, 'a'));               // []
console.log(arr4);                                  // [1, "a", 2, 3]

const arr5 = [1, 2, 3];
console.log(splice(arr5, 0, 0, 'a'));               // []
console.log(arr5);                                  // ["a", 1, 2, 3]

// splice function from Trevor LaSarre

function splice(arr, start, deleteCount, ...args) {
  if (start > arr.length) start = arr.length;
  if (deleteCount > (arr.length - start)) deleteCount = (arr.length - start);

  let firstRemainingIdx = (start + deleteCount);
  let remaining = arr.slice(firstRemainingIdx, arr.length);
  let deleted = arr.slice(start, firstRemainingIdx);

  arr.length = start;
  arr.push(...args);
  arr.push(...remaining);

  return deleted;
}
/*
This approach first creates an array of remaining elements that occur after the section which is to be deleted. 
It then creates another array of the elements that are meant to be deleted. 
All elements from start onward are deleted by reassigning the array's length. args are added back in if they exist. 
Then, remaining elements are added back in before deleted elements are returned.
*/