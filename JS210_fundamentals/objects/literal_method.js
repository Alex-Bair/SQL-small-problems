const person = {
  firstName() {
    return 'Victor';
  },
  lastName() {
    return 'Reyes';
  },
};

console.log(`${person.firstName} ${person.lastName}`); // The function definitions will be output - the code does not *call* the firstName or lastName functions after accessing them.