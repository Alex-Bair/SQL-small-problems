function callback1() {
  console.log('callback1');
}

function callback2() {
  console.log('callback2');
}

function callback3() {
  console.log('callback3');
}

function randomizer(...callbackFuncs) {
  let currentTime = 0;
  let endTime = 2 * callbackFuncs.length;
  let executionTimes = callbackFuncs.map(() => Math.random() * endTime * 1000);

  callbackFuncs.forEach((func, index) => {
    setTimeout(func, executionTimes[index]);
  });
  
  let intervalId = setInterval(() => {
    currentTime += 1;
    console.log(currentTime);
    if (currentTime >= endTime) {
      clearInterval(intervalId); 
    }
  }, 1000);  
}

randomizer(callback1, callback2, callback3);

// Output:
// 1
// 2
// "callback2"
// 3
// "callback3"
// 4
// 5
// "callback1"
// 6