/*

- Get all dates with booked schedules from /api/bookings with GET
  - store in an array like returned by API call
- Get all bookings for each date from /api/bookings/:date with GET
  - store in object, with the key being the date and the value being an array of bookings (i.e. what's returned by the API call)
  - ex: {
          date1: [[booking1details], [booking2details]],
          ...
        }
- have dates as LI in an UL
  - have ids with the specific date
- have bookings for each date as LIs in a UL in the date LI
  - have the inner UL hidden
- place event listeners on each date LI to unhide the inner UL

*/

function request(method, url) {
  return new Promise((resolve, reject) => {
    let req = new XMLHttpRequest();
    req.open(method, url);
    req.responseType = 'json';
    req.addEventListener('load', event => resolve(req.response));
    req.send();
  });
}

function getDatesAndBookings() {
  let bookingsPromises = [];
  let datesPromise = request('GET', '/api/bookings');

  datesPromise.then(a => {
    dates = a;
  
    dates.forEach(d => {
      let bookingsPromise = request('GET', '/api/bookings/' + d);
      bookingsPromises.push(bookingsPromise);
  
      bookingsPromise.then(b => {
        bookings[d] = b;
      });
    });

    let buildEvent = new CustomEvent('buildUl');

    Promise.all(bookingsPromises).finally(e => document.dispatchEvent(buildEvent));
  });
}

function createBookingLi(booking) {
  let li = document.createElement('LI');
  li.textContent = booking.join(' | ');
  
  return li;
}

function appendLi(outerUl, date, bookings) {
  let dateLi = document.createElement('LI');
  dateLi.id = date;
  dateLi.textContent = date;
  
  let innerUl = document.createElement('UL');
  innerUl.hidden = true;

  bookings.forEach(booking => {
    innerUl.appendChild(createBookingLi(booking));
  });

  dateLi.appendChild(innerUl);
  outerUl.appendChild(dateLi);
}

function buildList(dates, bookings) {
  let outerUl = document.createElement('UL');

  dates.forEach(date => {
    appendLi(outerUl, date, bookings[date]);
  });

  outerUl.addEventListener('click', event => {
    let li = event.target;
    if (!dates.includes(event.target.id)) {
      return;
    }

    li.querySelector('ul').hidden = false;
  });

  document.body.appendChild(outerUl);
}

let bookings = {};
let dates;

getDatesAndBookings();

document.addEventListener('DOMContentLoaded', event => {
  document.addEventListener('buildUl', event => buildList(dates, bookings));
});