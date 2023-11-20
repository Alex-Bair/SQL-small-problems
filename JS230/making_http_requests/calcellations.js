function cancelSchedule(scheduleId) {
  let request = new XMLHttpRequest();

  request.open('DELETE', '/api/schedules/' + String(scheduleId));
  request.addEventListener('load', event => {
    if (request.status === 204) {
      alert('Schedule canceled');
    } else {
      alert('Cancel failed: ' + request.responseText);
    }
  });

  request.send();
}


function cancelBooking(bookingId) {
  let request = new XMLHttpRequest();

  request.open('PUT', '/api/bookings/' + String(bookingId));
  request.addEventListener('load', event => {
    if (request.status === 204) {
      alert('Booking canceled');
    } else {
      alert('Cancel failed: ' + request.responseText);
    }
  });

  request.send();
}

// Further Exploration - delayed to complete at a later date