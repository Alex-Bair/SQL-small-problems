document.addEventListener('DOMContentLoaded', event => {
  const INVALID_PASSWORD_MESSAGE = 'Password must be at least 10 characters long.';
  const INVALID_CREDIT_CARD_MESSAGE = 'Please enter a valid credit card'
  const REQUIRED_FIELD_MESSAGE = ' is a required field.';
  const FORM_ERROR_MESSAGE = 'Form cannot be submitted until errors are corrected.';

  let form = document.querySelector('form');
  let formErrorMessage = document.querySelector('p.error_message');
  let inputList = document.querySelector('dl');

  function formatInputName(name, capitalizeFirstLetter = false) {
    let formattedName = name.replace('_', ' ');
    let firstLetter = capitalizeFirstLetter ? name[0].toUpperCase() : name[0];
    return firstLetter + formattedName.slice(1);
  }

  function setFormErrorMessage() {
    formErrorMessage.textContent = FORM_ERROR_MESSAGE;
  }

  function clearFormErrorMessage() {
    formErrorMessage.textContent = '';
  }

  function setErrorMessage(input, validity, errorSpan) {
    let inputName = input.name;

    if (validity.valueMissing) {
      errorSpan.textContent = formatInputName(inputName) + REQUIRED_FIELD_MESSAGE;
    } else if (validity.tooShort && inputName === 'password') {
      errorSpan.textContent = INVALID_PASSWORD_MESSAGE;
    } else if (validity.patternMismatch) {
      errorSpan.textContent = 'Please enter a valid ' + formatInputName(inputName) + '.';
    }
  }

  function isNotCreditCardInput(input) {
    return input.name !== 'credit_card';
  }

  function noInvalidCreditCardInputs() {
    let invalidInputs = creditCardInputs.filter(input => !input.validity.valid);
    return invalidInputs.length === 0;
  }

  function validateInput(event, input = undefined) {
    input ||= event.target;
    let inputValidity = input.validity;
    let errorSpan = input.parentElement.querySelector('span.error_message');
    // debugger;

    if (inputValidity.valid) {
      input.classList.remove('invalid');
      if (isNotCreditCardInput(input) || noInvalidCreditCardInputs()) errorSpan.textContent = '';
      if (form.checkValidity()) clearFormErrorMessage();
    } else {
      input.classList.add('invalid');
      setErrorMessage(input, inputValidity, errorSpan);
    }
  }

  inputList.addEventListener('focusin', event => {
    let input = event.target;
    let errorSpan = input.nextElementSibling;

    errorSpan.textContent = '';
  });

  inputList.addEventListener('focusout', validateInput);

  form.addEventListener('submit', event => {
    event.preventDefault();

    if (!form.checkValidity()) {
      setFormErrorMessage();
      inputList.querySelectorAll('input').forEach(input => validateInput(null, input));
    } else {
      let serializedFormData = new URLSearchParams(new FormData(form));
      let creditCardNums = serializedFormData.getAll('credit_card');
      serializedFormData.delete('credit_card');
      serializedFormData.append('credit_card', creditCardNums.join(''));
      document.getElementById('serialized_data').textContent = serializedFormData;
      debugger;
      // serialize form data here!!!!!
    }
  });

  //prevent non-numeric characters in phone & cc, prevent non alphabet characters in first and last names

  function invalidPhoneCharacter(inputElement, key) {
    const PHONE_NUMBER_CHARACTER_REGEX = /[\d-]/;
    return inputElement.inputMode === 'decimal' && !key.match(PHONE_NUMBER_CHARACTER_REGEX);
  }

  function invalidNumberCharacter(inputElement, key) {
    const NUMBER_REGEX = /\d/;
    return inputElement.inputMode === 'numeric' && !key.match(NUMBER_REGEX);
  }

  function invalidNameCharacter(inputElement, key) {
    const NAME_CHARACTER_REGEX = /[a-zA-Z'\s]/;
    return (inputElement.id === 'first_name' || inputElement.id === 'last_name') && !key.match(NAME_CHARACTER_REGEX);
  }

  function invalidCharacter(inputElement, key) {
    return invalidPhoneCharacter(inputElement, key) || invalidNumberCharacter(inputElement, key) || invalidNameCharacter(inputElement, key);
  }

  inputList.addEventListener('keydown', event => {
    const NUMBER_REGEX = /\d/;

    const NAME_CHARACTER_REGEX = /[a-zA-Z'\s]/;
    
    let input = event.target;
    let key = event.key;

    if (key === 'Backspace' || key === 'Tab') return;

    if (invalidCharacter(input, key)) {
      event.preventDefault();
    }
  });

  // automatically tab over to the next CC input once the 4th digit is entered
  let creditCardInputs = Array.from(inputList.querySelectorAll('input[name="credit_card"]'));

  creditCardInputs.forEach((input, index) => {
    if (index === creditCardInputs.length - 1) return;

    input.addEventListener('keyup', event => {
      if (event.key === 'Tab' || event.key === 'Shift') return;
      
      if (input.value.length === input.maxLength) {
        input.nextElementSibling.focus();
      }
    });
  });

  // Further Exploration

});