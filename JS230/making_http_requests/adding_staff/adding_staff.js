// function isInvalidInput(value) {
//   return value === '';
// }

function createRequest(method, url) {
  let request = new XMLHttpRequest();
  request.open(method, url);
  // request.responseType = 'json';
  
  return request;
}

document.addEventListener('DOMContentLoaded', () => {
  // let emailInput = document.getElementById('email');
  // let nameInput = document.getElementById('name');
  let form = document.getElementById('add_staff_form');

  form.addEventListener('submit', event => {
    event.preventDefault();

    // if (isInvalidInput(emailInput.value) || isInvalidInput(nameInput.value)) {
    //   alert('Staff can not be created. Check your inputs.');
    //   return;
    // }

    let request = createRequest(form.method, form.action);
    let data = new FormData(form);

    request.addEventListener('load', event => {
      if (request.status === 201) {
        let id = JSON.parse(request.response).id;
        alert('Successfully created staff with id: ' + String(id));
        form.reset();
      } else if (request.status === 400) {
        alert(request.responseText);
      }
    });

    request.send(data);
  });
});