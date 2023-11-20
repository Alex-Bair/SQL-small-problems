// let ladder = ''

// ['head', 'heal', 'teal', 'tell', 'tall', 'tail'].forEach(word => {
//   if (ladder !== '') {
//     ladder += '-'
//   }

//   ladder += word
// })

// console.log(ladder)  // expect: head-heal-teal-tell-tall-tail

/*

There is a missing semicolon at the end of line 1.

Without the semicolon, JavaScript parses the first three lines as

let ladder = ''['head', 'heal', 'teal', 'tell', 'tall', 'tail'].forEach()

This means JavaScript tries to access the ['head', 'heal', 'teal', 'tell', 'tall', 'tail'] property of the empty string, which does not exist and returns undefined.

*/

let ladder = '';

['head', 'heal', 'teal', 'tell', 'tall', 'tail'].forEach(word => {
  if (ladder !== '') {
    ladder += '-'
  }

  ladder += word
})

console.log(ladder)  // expect: head-heal-teal-tell-tall-tail