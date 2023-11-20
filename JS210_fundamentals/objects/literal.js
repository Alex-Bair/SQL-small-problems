const myObject = {
  a: 'name',
  'b': 'test',
  123: 'c',
  1: 'd',
};

myObject[1];
myObject[a]; // no variable `a` is declared - this is not a literal string "a"
myObject.a;