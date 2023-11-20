"use strict";

const MINUTES_PER_DEGREE = 60;
const SECONDS_PER_MINUTE = 60;

function padLeftZero(num) {
  let numString = String(num);
  if (numString.length < 2) {
    numString = '0' + numString;
  }

  return numString;
}

function dms(inputDegrees) {
  let degrees = Math.trunc(inputDegrees);
  let minutesAndSeconds = (inputDegrees - degrees) * MINUTES_PER_DEGREE;
  let minutes = Math.trunc(minutesAndSeconds);
  let seconds = Math.trunc((minutesAndSeconds - minutes) * SECONDS_PER_MINUTE);

  let resultString = `${degrees}˚${padLeftZero(minutes)}'${padLeftZero(seconds)}"`;

  return resultString;
}

console.log(dms(30));           // 30°00'00"
console.log(dms(76.73));        // 76°43'48"
console.log(dms(254.6));        // 254°35'59"
console.log(dms(93.034773));    // 93°02'05"
console.log(dms(0));            // 0°00'00"
console.log(dms(360));          // 360°00'00" or 0°00'00"


// Further Exploration

function improvedDms(degrees) {
  while (degrees < 0) {
    degrees += 360;
  }

  while (degrees > 360) {
    degrees -= 360;
  }

  return dms(degrees);
  
}

console.log(improvedDms(-1));   // 359°00'00"
console.log(improvedDms(400));  // 40°00'00"
console.log(improvedDms(-40));  // 320°00'00"
console.log(improvedDms(-420)); // 300°00'00"