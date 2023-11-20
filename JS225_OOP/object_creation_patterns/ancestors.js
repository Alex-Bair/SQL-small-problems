Object.prototype.ancestors = function() {
  let ancestorArr = [];
  let obj = this;
  
  while (true) {
    obj = Object.getPrototypeOf(obj);
    if (obj.name === undefined) {
      ancestorArr.push('Object.prototype');
      break;
    }
    ancestorArr.push(obj.name);
  }
  
  console.log(ancestorArr);
  return ancestorArr;
};




// name property added to make objects easier to identify
const foo = {name: 'foo'};
const bar = Object.create(foo);
bar.name = 'bar';
const baz = Object.create(bar);
baz.name = 'baz';
const qux = Object.create(baz);
qux.name = 'qux';

qux.ancestors();  // returns ['baz', 'bar', 'foo', 'Object.prototype']
baz.ancestors();  // returns ['bar', 'foo', 'Object.prototype']
bar.ancestors();  // returns ['foo', 'Object.prototype']
foo.ancestors();  // returns ['Object.prototype']

// LS Solution - uses recursion

Object.prototype.ancestors = function ancestors() {
  const ancestor = Object.getPrototypeOf(this);

  if (Object.prototype.hasOwnProperty.call(ancestor, 'name')) {
    return [ancestor.name].concat(ancestor.ancestors());
  }

  return ['Object.prototype'];
};