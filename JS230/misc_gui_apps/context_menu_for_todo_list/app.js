const todoItems = [
  { id: 1, title: 'Homework' },
  { id: 2, title: 'Shopping' },
  { id: 3, title: 'Calling Mom' },
  { id: 4, title: 'Coffee with John '}
];

document.addEventListener('DOMContentLoaded', event => {
  function App() {
    this.init();
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
      if ($('div[data-id="overlay"]:visible').length === 0) {
        $('div[data-id="overlay"]').fadeTo(500, 0.5);
        $('div[data-id="delete_confirmation"]').fadeIn(500);
      } else {
        $('div[data-id="overlay"]').fadeOut(100);
        $('div[data-id="delete_confirmation"]').fadeOut(100);
      }
    },

    handleContextMenuClick(event) {
      let clickedLi = event.target;
      if (clickedLi.tagName !== 'LI') return;
      
      if (clickedLi.dataset.id === 'delete_todo') {
        this.toggleConfirmation();
      }
    },

    handleChoice(event) {
      let clickedId = event.target.dataset.id;

      if (!['overlay', 'no', 'yes'].includes(clickedId)) return;

      if (clickedId === 'yes') this.selectedTodo.remove();

      this.selectedTodo = null;
      this.toggleConfirmation();
    },

    showContextMenu(event) {
      if (event.target.tagName !== 'LI') return;

      event.preventDefault();
      this.contextMenu.style.top = `${event.clientY}px`;
      this.contextMenu.style.left = `${event.clientX}px`;
      $('.context_menu').fadeIn(500);

      this.selectedTodo = event.target;
    },

    handleClick(event) {
      if ($('.context_menu:visible').length === 1) {
        $('.context_menu').fadeOut(100);
      }
    },

    init() {
      this.selectedTodo = null;
      this.todos = todoItems;
      this.todoList = document.querySelector('ul[data-id="todo_list"]');
      this.overlay = document.querySelector('div[data-id="overlay"]');
      this.deleteConfirmationPopup = document.querySelector('div[data-id="delete_confirmation"]');
      this.contextMenu = document.querySelector('.context_menu');
      this.todoTemplate = this.compileTemplate();
    },

    bindEvents() {
      this.contextMenu.addEventListener('click', this.handleContextMenuClick.bind(this));
      this.todoList.addEventListener('contextmenu', this.showContextMenu.bind(this));
      document.querySelector('main').addEventListener('click', this.handleChoice.bind(this));
      document.addEventListener('click', this.handleClick.bind(this));
    }
  };
  
  new App();
})