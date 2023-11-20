const greeter = function(greeting, name) {
  return {
    message: `${greeting} ${name}!`,
    sayGreetings() {
      console.log(this.message);
    }
  };
}('Hello', 'Naveed');

greeter.sayGreetings();