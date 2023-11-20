function isItemAvailable(itemId, transactionList) {
  let relevantTransactions = transactionsFor(itemId, transactionList);

  let total = totalItemQuantity(relevantTransactions);
  return total > 0;
}

function transactionsFor(itemId, transactionList) {
  return transactionList.filter(item => item.id === itemId);
}

function totalItemQuantity(transactionList) {
  return transactionList.reduce((total, item) => {
    if (item.movement === 'in') {
      total += item.quantity;
    } else {
      total -= item.quantity;
    }

    return total;
  }, 0); 
}

const transactions = [ { id: 101, movement: 'in',  quantity:  5 },
                       { id: 105, movement: 'in',  quantity: 10 },
                       { id: 102, movement: 'out', quantity: 17 },
                       { id: 101, movement: 'in',  quantity: 12 },
                       { id: 103, movement: 'out', quantity: 15 },
                       { id: 102, movement: 'out', quantity: 15 },
                       { id: 105, movement: 'in',  quantity: 25 },
                       { id: 101, movement: 'out', quantity: 18 },
                       { id: 102, movement: 'in',  quantity: 22 },
                       { id: 103, movement: 'out', quantity: 15 }, ];

console.log(isItemAvailable(101, transactions));     // false
console.log(isItemAvailable(105, transactions));     // true