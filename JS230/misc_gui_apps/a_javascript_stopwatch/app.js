document.addEventListener('DOMContentLoaded', event => {
  class Timer {
    constructor() {
      this.centisecondsElement = document.getElementById('centiseconds');
      this.secondsElement = document.getElementById('seconds');
      this.minutesElement = document.getElementById('minutes');
      this.hoursElement = document.getElementById('hours');
      this.startStopButton = document.getElementById('toggle');
      this.resetTimer();
      this.intervalId = null;
      this.bindEvents();
    }

    incrementCentiseconds() {
      this.centiseconds += 1;
      if (this.centiseconds >= 100) {
        this.centiseconds = 0;
        this.incrementSeconds();
      }

      this.updateDisplay(this.centisecondsElement, this.padLeftZero(this.centiseconds));
    }

    incrementSeconds() {
      this.seconds += 1;
      if (this.seconds >= 60) {
        this.seconds = 0;
        this.incrementMinutes();
      }

      this.updateDisplay(this.secondsElement, this.padLeftZero(this.seconds));
    }

    incrementMinutes() {
      this.minutes += 1;
      if (this.minutes >= 60) {
        this.minutes = 0;
        this.incrementHours();
      }

      this.updateDisplay(this.minutesElement, this.padLeftZero(this.minutes));
    }

    incrementHours() {
      this.hours += 1;
      this.updateDisplay(this.hoursElement, this.padLeftZero(this.hours));
    }

    padLeftZero(number) {
      let stringNum = String(number);
      if (stringNum.length === 1) {
        return '0' + stringNum;
      } else {
        return stringNum;
      }
    }

    updateDisplay(element, string) {
      element.textContent = string;
    }

    startTimer() {
      this.intervalId = setInterval(this.incrementCentiseconds.bind(this), 10);
      this.startStopButton.textContent = 'Stop';
    }

    stopTimer() {
      clearInterval(this.intervalId);
      this.intervalId = null;
      this.startStopButton.textContent = 'Start';
    }

    handleStopStart() {
      if (this.startStopButton.textContent === 'Start') {
        this.startTimer();
      } else {
        this.stopTimer();
      }
    }

    resetTimer() {
      this.stopTimer();
      this.centiseconds = 0;
      this.seconds = 0;
      this.minutes = 0;
      this.hours = 0;
      [this.centisecondsElement, this.secondsElement, this.minutesElement, this.hoursElement].forEach(span => {
        this.updateDisplay(span, '00');
      });
    }

    bindEvents() {
      this.startStopButton.addEventListener('click', this.handleStopStart.bind(this));
      document.getElementById('reset').addEventListener('click', this.resetTimer.bind(this));
    }
  }

  new Timer();
})