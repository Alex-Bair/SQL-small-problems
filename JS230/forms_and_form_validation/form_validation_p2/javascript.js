document.addEventListener('DOMContentLoaded', event => {
  const INVALID_PASSWORD_MESSAGE = 'Password must be at least 10 characters long.';
  const REQUIRED_FIELD_MESSAGE = ' is a required field.';
  const FORM_ERROR_MESSAGE = 'Form cannot be submitted until errors are corrected.';

  let form = document.querySelector('form');
  let formErrorMessage = document.querySelector('p.error_message');
  let inputList = document.querySelector('dl');

  function formatInputName(name) {
    let formattedName = name.replace('_', ' ');
    return name[0].toUpperCase() + formattedName.slice(1);
  }

  function setFormErrorMessage() {
    formErrorMessage.textContent = FORM_ERROR_MESSAGE;
  }

  function clearFormErrorMessage() {
    formErrorMessage.textContent = '';
  }

  function setErrorMessage(input, validity, errorSpan) {
    let inputID = input.id;

    if (validity.valueMissing) {
      errorSpan.textContent = formatInputName(inputID) + REQUIRED_FIELD_MESSAGE;
    } else if (validity.tooShort && inputID === 'password') {
      errorSpan.textContent = INVALID_PASSWORD_MESSAGE;
    } else if (validity.patternMismatch) {
        errorSpan.textContent = 'Please enter a valid ' + formatInputName(inputID) + '.';
    }
  }

  function validateInput(event, input = undefined) {
    input ||= event.target;
    let inputValidity = input.validity;
    let errorSpan = input.nextElementSibling;

    if (inputValidity.valid) {
      input.classList.remove('invalid');
      errorSpan.textContent = '';
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
    if (!form.checkValidity()) {
      event.preventDefault();
      setFormErrorMessage();
      inputList.querySelectorAll('input').forEach(input => validateInput(null, input));
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
});