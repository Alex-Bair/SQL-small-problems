const todoItems = [
  { id: 1, title: 'Homework' },
  { id: 2, title: 'Shopping' },
  { id: 3, title: 'Calling Mom' },
  { id: 4, title: 'Coffee with John '}
];

document.addEventListener('DOMContentLoaded', event => {
  function App() {
    this.selectedTodo = null;
    this.todos = todoItems;
    this.todoList = document.querySelector('ul[data-id="todo_list"]');
    this.overlay = document.querySelector('div[data-id="overlay"]');
    this.deleteConfirmationPopup = document.querySelector('div[data-id="delete_confirmation"]');
    this.todoTemplate = this.compileTemplate();
    this.renderTodos();
    this.bindEvents();
  }

  App.prototype = {
    compileTemplate() {
      let scriptElement = document.querySelector("script[data-type='todos_template']");
      scriptElement.remove();
      return Handlebars.compile(scriptElement.innerHTML);
    },

    renderTodos() {
      this.todoList.insertAdjacentHTML('beforeend', this.todoTemplate({todos: this.todos}));
    },

    toggleConfirmation() {
      this.overlay.classList.toggle('hidden');
      this.deleteConfirmationPopup.classList.toggle('hidden');
    },

    handleDeleteClick(event) {
      if (event.target.tagName !== 'A' && !event.target.classList.contains('delete')) return;
      event.preventDefault();
      this.toggleConfirmation();
      this.selectedTodo = event.target.parentElement;
    },

    handleChoice(event) {
      let clickedId = event.target.dataset.id;

      if (!['overlay', 'no', 'yes'].includes(clickedId)) return;

      if (clickedId === 'yes') this.selectedTodo.remove();

      this.selectedTodo = null;
      this.toggleConfirmation();
    },

    bindEvents() {
      this.todoList.addEventListener('click', this.handleDeleteClick.bind(this));
      document.querySelector('main').addEventListener('click', this.handleChoice.bind(this));
    }
  };
  
  new App();
})