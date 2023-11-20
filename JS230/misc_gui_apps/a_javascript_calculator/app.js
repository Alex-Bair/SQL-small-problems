// Need to keep track of current operation and set next operation (whatever the user clicked) AFTER calculating the result of the current operation and the user input.... NEED TO REFACTOR!!!!!!!!



let buttons = [
  'CE', 'C', 'NEG', '/',
  '7', '8', '9', 'x',
  '4', '5', '6', '-',
  '1', '2', '3', '+',
  '0', '.', '%', '=',
];

document.addEventListener('DOMContentLoaded', event => {
  function App() {
    this.init();
    this.bindEvents();
  }

  App.prototype = {
    buildButtons() {
      let scriptTemplate = document.querySelector('script[type="text/x-handlebars"]');
      scriptTemplate.remove();

      let buttonTemplate = Handlebars.compile(scriptTemplate.innerHTML);

      this.buttons.forEach(value => {
        this.buttonsContainer.insertAdjacentHTML('beforeend', buttonTemplate({value}));
      });
    },

    clearEntryWindow() {
      this.entryWindow.textContent = '0';
    },

    clearOperationWindow() {
      this.operationWindow.textContent = '';
    },

    clearBothWindows() {
      this.clearEntryWindow();
      this.clearOperationWindow();
      this.result = 0;
    },

    negateEntryWindow() {
      let firstCharacter = this.entryWindow.textContent[0];
      if (firstCharacter === '0') {
        return;
      } else if (firstCharacter === '-') {
        this.entryWindow.textContent = this.entryWindow.textContent.slice(1);
      } else {
        this.entryWindow.textContent = '-' + this.entryWindow.textContent;
      }
    },

    // divide() {
    //   this.appendToOperationWindow('/');
    //   this.result /= Number(this.entryWindow.textContent);
    //   this.updateEntryWindowWithResult();
    // },

    // multiply() {
    //   this.appendToOperationWindow('x');
    //   this.result *= Number(this.entryWindow.textContent);
    //   this.updateEntryWindowWithResult();
    // },

    // subtract() {
    //   this.appendToOperationWindow('-');
    //   this.result -= Number(this.entryWindow.textContent);
    //   this.updateEntryWindowWithResult();
    // },

    // add() {
    //   this.appendToOperationWindow('+');
    //   this.result += Number(this.entryWindow.textContent);
    //   this.updateEntryWindowWithResult();
    //   },

    decimal() {
      if (!this.entryWindow.textContent.match(/\./)) {
        this.entryWindow.textContent += '.';
      }
    },

    // modulo() {
    //   this.appendToOperationWindow('%');
    //   this.result %= Number(this.entryWindow.textContent);
    //   this.updateEntryWindowWithResult();
    // },

    equals() {
      let operationString = this.operationWindow.textContent.at(-1);

      if (!operationString) return;

      this.operationDispatchTable[operationString].call(this);

      this.clearOperationWindow();
    },

    appendNumber(num) {
      if (this.entryWindow.textContent === '0' || this.startNewNumber) {
        this.entryWindow.textContent = String(num);
        this.startNewNumber = false;
        if (!this.operationWindow.textContent) this.result = 0;
      } else {
        this.entryWindow.textContent += String(num);
      }
    },

    appendToOperationWindow(operation) {
      this.operationWindow.textContent += ` ${this.entryWindow.textContent} ${operation}`;
    },

    calculateResult(operation) {
      let currentResult = this.result;
      this.updateEntryWindowWithResult();
      switch (operation) {
        case '+':
          this.result += Number(this.entryWindow.textContent);
          break;
        case '-':
          this.result -= Number(this.entryWindow.textContent);
          break;
        case '/':
          this.result /= Number(this.entryWindow.textContent);
          break;
        case 'x':
          this.result *= Number(this.entryWindow.textContent);
          break;
        case '%':
          this.result %= Number(this.entryWindow.textContent);
          break;
      }

      this.updateEntryWindowWithResult();
    },

    handleButtonClick(event) {
      if (event.target.tagName !== 'BUTTON') return;

      let operation = event.target.textContent;
      this.operationDispatchTable[operation].call(this);
    },

    updateEntryWindowWithResult() {
      debugger;
      this.entryWindow.textContent = String(this.result);
      this.startNewNumber = true;
    },

    init() {
      this.operationDispatchTable = {
        'CE': this.clearEntryWindow,
        'C': this.clearBothWindows,
        'NEG': this.negateEntryWindow,
        '/': this.divide,
        '7': this.appendNumber.bind(this, 7),
        '8': this.appendNumber.bind(this, 8),
        '9': this.appendNumber.bind(this, 9),
        'x': this.multiply,
        '4': this.appendNumber.bind(this, 4),
        '5': this.appendNumber.bind(this, 5),
        '6': this.appendNumber.bind(this, 6),
        '-': this.subtract,
        '1': this.appendNumber.bind(this, 1),
        '2': this.appendNumber.bind(this, 2),
        '3': this.appendNumber.bind(this, 3),
        '+': this.add,
        '0': this.appendNumber.bind(this, 0),
        '.': this.decimal,
        '%': this.modulo,
        '=': this.equals,
      };
      this.buttons = buttons;
      this.buttonsContainer = document.getElementById('buttons');
      this.operationWindow = document.getElementById('operation_window');
      this.entryWindow = document.getElementById('entry_window');
      this.buildButtons();
      this.result = 0;
      this.currentOperation = '+';
      this.startNewNumber = false;
    },

    bindEvents() {
      this.buttonsContainer.addEventListener('click', this.handleButtonClick.bind(this));
    },
  };

  new App();
});