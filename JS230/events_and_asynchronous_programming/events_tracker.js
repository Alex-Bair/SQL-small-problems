let divRed = document.getElementById('red');
let divBlue = document.getElementById('blue');
let divOrange = document.getElementById('orange');
let divGreen = document.getElementById('green');

let tracker = (function() {
  let events = [];
  return {
    elements() {
      return events.map(e => e.target);
    },
    
    list() {
      return events.slice();
    },
  
    add(event) {
      if (!events.includes(event)) events.push(event);
    },
  
    clear() {
      events.length = 0;
      return events.length;
    }
  };
})();

function track(callback) {
  return event => {
    tracker.add(event);
    callback(event);
  };
}

divRed.addEventListener('click', track(event => {
  document.body.style.background = 'red';
}));

divBlue.addEventListener('click', track(event => {
  event.stopPropagation();
  document.body.style.background = 'blue';
}));

divOrange.addEventListener('click', track(event => {
  document.body.style.background = 'orange';
}));

divGreen.addEventListener('click', track(event => {
  document.body.style.background = 'green';
}));