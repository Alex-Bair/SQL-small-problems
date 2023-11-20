function buyFruit(arr) {
  let fruit = [];

  arr.forEach(fruitQuantArr => {
    for (let instance = 1; instance <= fruitQuantArr[1]; instance += 1) {
      fruit.push(fruitQuantArr[0]);
    }
  });

  return fruit;
}

console.log(buyFruit([['apple', 3], ['orange', 1], ['banana', 2]]));
// returns ["apple", "apple", "apple", "orange", "banana", "banana"]