function countOccurrences(arr) {
  let count = {};

  arr.forEach(function(element) {
    if (count[element] === undefined) {
      count[element] = 1;
    } else {
      count[element] += 1;
    }
  });

  Object.keys(count).forEach(function(key) {
    console.log(`${key} => ${count[key]}`);
  });
}



const vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck',
                'motorcycle', 'motorcycle', 'car', 'truck'];

countOccurrences(vehicles);

// console output
// car => 4
// truck => 3
// SUV => 1
// motorcycle => 2