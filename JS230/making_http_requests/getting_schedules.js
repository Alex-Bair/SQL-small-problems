function getSchedules() {
  const TIMEOUT_LIMIT = 5000;
  let url = 'http://54.161.20.51:8080';
  let request = new XMLHttpRequest();
  request.open('GET', url + '/api/schedules');
  
  request.timeout = TIMEOUT_LIMIT;
  request.responseType = 'json';
  
  request.addEventListener('load', event => {
    let data = request.response;
    let scheduleCount = data.length;

    if (scheduleCount === 0) {
      alert('There are no schedules available for booking.');
    } else {
      let formattedData = data.reduce((acc, schedule) => {
        acc[schedule.staff_id] ||= 0;
        acc[schedule.staff_id] += 1;
        return acc;
      }, {});

      alert(Object.keys(formattedData).map(staff_id => `${staff_id}: ${formattedData[staff_id]}`).join("\n"));
    }
  });
  
  request.addEventListener('timeout', event => {
    alert(`${TIMEOUT_LIMIT / 1000} seconds have elapsed since sending the request. Request has timed out.`);
  });
  
  request.addEventListener('loadend', event => {
    alert('Request has finshed.');
  });
  
  request.send();
}

getSchedules();

// Further Exploration - solution from Marwan Zaarab

function createRequest(url, timeout = 5000) {
  let request = new XMLHttpRequest();
  request.open('GET', url);
  request.responseType = 'json';
  request.timeout = timeout;
  
  request.addEventListener('timeout', event => {
    alert(`${timeout / 1000} seconds have elapsed since sending the request. Request has timed out.`);
  });

  request.addEventListener('loadend', event => {
    alert('Request has finshed.');
  });

  return request;
}

function getSchedules() {
  const TIMEOUT_LIMIT = 5000;
  let url = 'http://54.161.20.51:8080';
  let request = createRequest(url + '/api/staff_members');
  
  request.addEventListener('load', event => {
    let staff = request.response;
    let staffIds = staff.map(staffMember => staffMember.id);
    let tally = [];

    staffIds.forEach(id => {
      let request = createRequest(url + '/api/schedules/' + id);
      let scheduleCount = 0;

      request.addEventListener('load', event => {
        scheduleCount = request.response.length;
        let obj = {};
        obj[id] = scheduleCount;
        if (scheduleCount > 0) tally.push(obj);
      });

      request.send();
    });

    alert(tally.map(obj => {
      let key = Object.keys(obj)[0];
      return `${key}: ${obj[key]}`;
    }).join("\n"));
  });
  
  request.send();
}

getSchedules();