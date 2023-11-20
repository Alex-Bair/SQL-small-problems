function newStack() {
  const stack = [];

  return {
    push(value) {
      stack.push(value);
    },

    pop() {
      return stack.pop();
    },

    printStack() {
      stack.forEach(value => console.log(value));
    }
  };
}

let stack = newStack();

stack.printStack();
stack.push(5);
stack.push(43);
stack.printStack();
console.log(stack.pop());
stack.printStack();