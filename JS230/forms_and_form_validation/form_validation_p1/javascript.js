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

  inputList.addEventListener('focusin', event => {
    let input = event.target;
    let errorSpan = input.nextElementSibling;

    errorSpan.textContent = '';
  });

  inputList.addEventListener('focusout', event => {
    let input = event.target;
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
  });

  form.addEventListener('submit', event => {
    if (!form.checkValidity()) {
      event.preventDefault();
      setFormErrorMessage();
    }
  });
});