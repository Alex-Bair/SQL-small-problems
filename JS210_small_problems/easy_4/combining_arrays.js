function union(arr1, arr2) {
  let combinedArray = arr1.slice();
  arr2.forEach(function(arr2Element) {
    if (!arr1.includes(arr2Element)) {
      combinedArray.push(arr2Element);
    }
  });

  return combinedArray;
}

console.log(union([1, 3, 5], [3, 6, 9]));    // [1, 3, 5, 6, 9]

// LS Solution using rest parameter

function copyNonDupsTo(resultArray, array) {
  array.forEach(value => {
    if (!resultArray.includes(value)) {
      resultArray.push(value);
    }
  });
}

function union(...args) {
  const newArray = [];

  args.forEach(value => copyNonDupsTo(newArray, value));

  return newArray;
}