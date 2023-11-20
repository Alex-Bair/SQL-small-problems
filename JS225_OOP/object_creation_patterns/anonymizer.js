let Account = (function() {

  let userPassword;
  let userEmail;
  let userFirstName;
  let userLastName;

  function generateDisplayName() {
    const DISPLAY_NAME_LENGTH = 16;
    const validChars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'.split('');
    let displayName = '';

    for (let iteration = 1; iteration <= DISPLAY_NAME_LENGTH; iteration += 1) {
      let index = Math.floor(randomNumberBetween(0, validChars.length));
      displayName += validChars[index];
    }

    return displayName;
  }
  
  function randomNumberBetween(min, max) {
    return Math.random() * (max - min) + min;
  }

  function isValidPassword(password) {
    return userPassword === password;
  }

  return {
    init(email, password, firstName, lastName) {
      userEmail = email;
      userPassword = password;
      userFirstName = firstName;
      userLastName = lastName;
      this.displayName = generateDisplayName();
      return this;
    },

    reanonymize(password) {
      if (isValidPassword(password)) {
        this.displayName = generateDisplayName();
        return true;
      } else {
        return 'Invalid Password';
      }
    },

    resetPassword(currentPassword, newPassword) {
      if (isValidPassword(currentPassword)) {
        userPassword = newPassword;
        return true;
      } else {
        return 'Invalid Password';
      }
    },

    firstName(password) {
      if (isValidPassword(password)) {
        return userFirstName;
      } else {
        return 'Invalid Password';
      }
    },

    lastName(password) {
      if (isValidPassword(password)) {
        return userLastName;
      } else {
        return 'Invalid Password';
      }
    },

    email(password) {
      if (isValidPassword(password)) {
        return userEmail;
      } else {
        return 'Invalid Password';
      }
    },
  };
})();


let fooBar = Object.create(Account).init('foo@bar.com', '123456', 'foo', 'bar');
console.log(fooBar.firstName);                     // returns the firstName function
console.log(fooBar.email);                         // returns the email function
console.log(fooBar.firstName('123456'));           // logs 'foo'
console.log(fooBar.firstName('abc'));              // logs 'Invalid Password'
console.log(fooBar.displayName);                   // logs 16 character sequence
console.log(fooBar.resetPassword('123', 'abc'));    // logs 'Invalid Password';
console.log(fooBar.resetPassword('123456', 'abc')); // logs true

let displayName = fooBar.displayName;
console.log(fooBar.reanonymize('abc'));                         // logs true
console.log(displayName === fooBar.displayName);   // logs false

// Further Exploration

