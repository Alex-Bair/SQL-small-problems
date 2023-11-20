function swapName(fullName) {
  let names = fullName.split(' ');

  return names.reverse().join(', ');
}


console.log(swapName('Joe Roberts'));    // "Roberts, Joe"

// Further Exploration

function swapName(fullName) {
  let names = fullName.split(' ');

  names.unshift(names.pop() + ',');
  
  return names.join(' ');
}

console.log(swapName('Joe Michael Brown'));