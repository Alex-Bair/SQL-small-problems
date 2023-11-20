function shortLongShort(string1, string2) {
  let shortString;
  let longString;

  if (string1.length > string2.length) {
    shortString = string2;
    longString = string1;
  } else {
    shortString = string1;
    longString = string2;
  }

  console.log(shortString + longString + shortString);

  return shortString + longString + shortString;
}

shortLongShort('abc', 'defgh');    // "abcdefghabc"
shortLongShort('abcde', 'fgh');    // "fghabcdefgh"
shortLongShort('', 'xyz');         // "xyz"

// LS Solution

function shortLongShort(string1, string2) {
  if (string1.length > string2.length) {
    return string2 + string1 + string2;
  } else {
    return string1 + string2 + string1;
  }
}