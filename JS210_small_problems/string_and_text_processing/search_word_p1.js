// function searchWord(searchWord, text) {
//   searchWord = searchWord.toLowerCase();
//   let words = text.split(' ');
//   return words.reduce((count, word) => {
//     if (word.toLowerCase() === searchWord) {
//       count += 1;
//     }
    
//     return count;
//   }, 0);
// }

const text = 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?';

console.log(searchWord('sed', text));      // 3

// LS Solution

// function searchWord(word, text) {
//   const REGEX = new RegExp(word, 'gi');
//   const matches = text.match(REGEX);

//   return matches ? matches.length : 0;
// }

// Further Exploration

function searchWord(word, text) {
  if (word === undefined || text == undefined) {
    return 'Please provide two valid arguments';
  }

  const REGEX = new RegExp('\\b' + word + '\\b', 'gi');
  const matches = text.match(REGEX);

  return matches ? matches.length : 0;
}

console.log(searchWord('qui', text));      // should return 4, NOT 13