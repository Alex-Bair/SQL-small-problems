function constructNewScheduleFieldset() {
  fieldsetCount += 1;
  let fieldset = document.createElement('FIELDSET');
  fieldset.id = String(fieldsetCount);

  appendLegend(fieldset);
  appendSelect(fieldset);
  appendLinebreak(fieldset);
  appendDateInput(fieldset);
  appendLinebreak(fieldset);
  appendTimeInput(fieldset);
  return fieldset;
}

function appendLinebreak(fieldset) {
  fieldset.appendChild(document.createElement('BR'));
}

function appendLegend(fieldset) {
  let legend = document.createElement('LEGEND');
  legend.textContent = 'Schedule ' + fieldset.id;
  fieldset.appendChild(legend);
}

function appendSelect(fieldset) {
  let selectName = 'schedule_' + fieldset.id;

  let label = document.createElement('LABEL');
  label.textContent = 'Staff Name: ';
  label.setAttribute('for', selectName);

  let select = document.createElement('SELECT');

  select.name = selectName;
  select.id = selectName;

  staff.forEach(member => {
    let option = document.createElement('OPTION');
    option.textContent = member.name;
    option.setAttribute('value', member.id);
    select.appendChild(option);
  });
  
  fieldset.appendChild(label);
  fieldset.appendChild(select);
}

function appendDateInput(fieldset) {
  let label = document.createElement('LABEL');
  label.setAttribute('for', 'date');
  label.textContent = 'Date: ';

  let dateInput = document.createElement('INPUT');
  dateInput.setAttribute('type', 'text');
  dateInput.setAttribute('name', 'date');
  dateInput.setAttribute('placeholder', 'mm-dd-yy');

  fieldset.appendChild(label);
  fieldset.appendChild(dateInput);
}

function appendTimeInput(fieldset) {
  let label = document.createElement('LABEL');
  label.setAttribute('for', 'time');
  label.textContent = 'Time: ';

  let timeInput = document.createElement('INPUT');
  timeInput.setAttribute('type', 'text');
  timeInput.setAttribute('name', 'time');
  timeInput.setAttribute('placeholder', 'hh:mm');

  fieldset.appendChild(label);
  fieldset.appendChild(timeInput);
}

function getAvailableStaff() {
  let request = new XMLHttpRequest();

  request.open('GET', 'http://3.80.247.98:8080/api/staff_members'); // need to change to appropriate URL depending on whatever dynamic IP address is assigned to my instance
  request.responseType = 'json';
  
  request.addEventListener('load', event => {
    staff = request.response;
  });
  
  request.send();

  return request;
}

function selectedOption(selectElement) {
  let selectedIndex = selectElement.selectedIndex;

  return selectElement.options[selectedIndex];
}

function convertFieldsetIntoObject(fieldset) {
  let time = fieldset.querySelector('input[name="time"]').value;
  let date = fieldset.querySelector('input[name="date"]').value;
  let staffId = selectedOption(fieldset.querySelector('select')).value;

  return {
    staff_id: Number(staffId),
    date: date,
    time: time,
  };
}

let fieldsetCount = 0;
let staff;

let staffRequest = getAvailableStaff();

document.addEventListener('DOMContentLoaded', event => {
  let form = document.getElementById('add_schedules');
  let moreSchedulesButton = document.getElementById('create_another_schedule_form');

  staffRequest.addEventListener('load', event => {
    form.appendChild(constructNewScheduleFieldset());

    moreSchedulesButton.addEventListener('click', event => {
      form.appendChild(constructNewScheduleFieldset());
    });
  });

  form.addEventListener('submit', event => {
    event.preventDefault();

    let fieldsets = [...document.querySelectorAll('fieldset')];
    let data = { schedules: fieldsets.map(convertFieldsetIntoObject) };
    const json = JSON.stringify(data);

    let request = new XMLHttpRequest();
    request.open('POST', 'http://3.80.247.98:8080/api/schedules');
    request.setRequestHeader('Content-Type', 'application/json');

    request.addEventListener('load', event => {
      alert(request.responseText);
      if (request.status === 201) form.reset();
    });

    request.send(json);
  });
});