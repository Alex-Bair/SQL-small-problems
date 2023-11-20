// function logInBox(string) {
//   let boxWidth = string.length + 2;

//   let topOrBottom = '+' + '-'.repeat(boxWidth) + '+';
//   let padding = '|' + ' '.repeat(boxWidth) + '|';
//   let body = `| ${string} |`;

//   [topOrBottom, padding, body, padding, topOrBottom].forEach((line) =>
//     console.log(line)
//   );
  
// }

// logInBox('To boldly go where no one has gone before.');
// logInBox('');

// Further Exploration

// Truncate the message if longer than the provided box length.

// function logInBox(string, max) {
//   let boxWidth = max || string.length + 2;

//   let topOrBottom = '+' + '-'.repeat(boxWidth) + '+';
//   let padding = '|' + ' '.repeat(boxWidth) + '|';
//   let body = `| ${string.substr(0, boxWidth - 2)} |`;

//   [topOrBottom, padding, body, padding, topOrBottom].forEach((line) =>
//     console.log(line)
//   );
  
// }

// logInBox('To boldly go where no one has gone before.', 9);

// Word wrap messages that are too long to fit

function logInBox(string, max) {
  let boxWidth = max || string.length + 2;

  let topOrBottom = '+' + '-'.repeat(boxWidth) + '+';
  let padding = '|' + ' '.repeat(boxWidth) + '|';

  console.log(topOrBottom);
  console.log(padding);

  for (let iteration = 1; iteration <= (string.length + 1) / (boxWidth - 2); iteration += 1) {
    let index = 0 + (iteration - 1) * (boxWidth - 2);
    let substring = string.substr(index, boxWidth - 2);
    let line = '| ' + substring + ' |';
    
    console.log(line);
  }

  console.log(padding);
  console.log(topOrBottom);
}

logInBox('To boldly go where no one has gone before.', 9);