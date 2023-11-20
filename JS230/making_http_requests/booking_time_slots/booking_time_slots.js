/*
- get all available staff members from /api/staff_members
- get all available schedules from /api/schedules
- create children option elements for the select element
  - have the textContent be "name | date | time" 
  - have the values be the schedule id

- submit booking form to /api/bookings using POST    START HERE!!!!!!!!!!!!!!!!
  - if response status is 204
    - alert "Booked"
  - if response status is 404 AND the response text contains "Student does not exist"
    - alert with the response text
    - unhide the form for student creation
      - have fields for email, name, and booking sequence
        - prepopulate email and booking sequence
  - if response status is 404 AND the response text does not contain "Student does not exist"
    - alert with the response text

- submit student creation form to /api/students using POST
  - if response status is 201
    - alert with the response text
    - submit the booking form again
    - reset forms
    - hide student creation form
  - if response status is 400
    - alert with the response text
*/

function request(method, url, data=undefined) { // see this SO post for inspiration for method    https://stackoverflow.com/a/30265431
  return new Promise((resolve, reject) => {
    let req = new XMLHttpRequest();
    req.open(method, url);
    req.responseType = 'json';
    req.addEventListener('load', event => resolve(req.response));
    req.send(data);
  });
}

function getAvailableStaff() {
  let staffPromise = request('GET', 'http://3.81.173.177:8080/api/staff_members');
  staffPromise.then(response => staff = response);

  return staffPromise;
}

function getAvailableSchedules() {
  let schedulesPromise = request('GET', 'http://3.81.173.177:8080/api/schedules');
  schedulesPromise.then(response => schedules = response);

  return schedulesPromise;
}

function staffNameFromId(staffId) {
  return staff.filter(obj => obj.id === staffId)[0].name; // will this comparison work (i.e. are they both strings or numbers?)
}

function createOption(schedule) {
  let option = document.createElement('OPTION');
  option.value = schedule.id;
  option.textContent = `${staffNameFromId(schedule.staff_id)} | ${schedule.date} | ${schedule.time}`;
  return option;
}

function appendOptions(selectElement) {
  schedules.map(createOption).forEach(option => selectElement.appendChild(option));
}

let staff = [];
let schedules = [];

document.addEventListener('DOMContentLoaded', event => {
  let select = document.querySelector('select');
  
  Promise.all([getAvailableStaff(), getAvailableSchedules()]).finally(p => appendOptions(select));

  let bookingForm = document.getElementById('booking_form');
  let studentForm = document.getElementById('student_form');

  bookingForm.addEventListener('submit', event => {
    event.preventDefault();
    let data = new FormData(bookingForm);

    let request = new XMLHttpRequest();
    request.open('POST', 'http://3.81.173.177:8080/api/bookings');

    request.addEventListener('load', event => {
      if (request.status === 204) {
        alert('Booked');
        bookingForm.reset();
      } else if (request.status === 404 && request.responseText.slice(0, 22) === 'Student does not exist') {
        document.querySelector('div').hidden = false;
        studentForm.querySelector('input[name="email"]').value = data.get('student_email');
        studentForm.querySelector('input[name="booking_sequence"]').value = request.responseText.match(/\d+/g)[0];
        alert(request.responseText);
      } else {
        alert(request.responseText);
      }
    });
    request.send(data);
  });
  
  studentForm.addEventListener('submit', event => {
    event.preventDefault();
    let data = new FormData(studentForm);

    let request = new XMLHttpRequest();
    request.open('POST', 'http://3.81.173.177:8080/api/students');

    request.addEventListener('load', event => {
      alert(request.responseText);
      if (request.status === 201) {
        bookingForm.dispatchEvent(new Event('submit'));
        studentForm.reset();
        document.querySelector('div').hidden = true;
      }
    });

    request.send(data);
  });
});