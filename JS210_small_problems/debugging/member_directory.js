const memberDirectory = {
  'Jane Doe': '323-8293',
  'Margaret Asbury': '989-1111',
  'Callum Beech': '533-9090',
  'Juanita Eastman': '424-1919',
};

// function isValidName(name) {
//   return (/^\w+ \w+$/).test(name);
// }

function isValidPhone(phone) {
  return (/^\d{3}-\d{4}$/).test(phone);
}

function validMemberInfo(name, phone) {
  return isValidName(name) && isValidPhone(phone);
}

function addMember(name, phone) {
  if (validMemberInfo(name, phone)) {
    memberDirectory[name] = phone;
  } else {
    console.log('Invalid member information.');
  }
}

addMember('Laura Carlisle', '444-2223');
addMember('Rachel Garcia', '232-1191');
addMember('Earl 5mith', '331-9191');
addMember('Alex B1air', '111-5246');
addMember('A_L_E_X Bair', '598-1191');

console.log(memberDirectory);

/*

The isValidName function's regex checks to ensure that the first and last name are word characters (\w). Word characters include the digits 0-9 and underscores. We need to change the isValidName functions regex to be /^[a-z]+ [a-z]+$/i

*/

function isValidName(name) {
  return (/^[a-z]+ [a-z]+$/i).test(name);
}

