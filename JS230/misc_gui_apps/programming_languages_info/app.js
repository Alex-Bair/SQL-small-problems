document.addEventListener('DOMContentLoaded', event => {
  const languages = [
    {
      name: 'Ruby',
      description: 'Ruby is a dynamic, reflective, object-oriented, ' +
      'general-purpose programming language. It was designed and developed in the mid-1990s ' +
      'by Yukihiro Matsumoto in Japan. According to its creator, Ruby was influenced by Perl, ' +
      'Smalltalk, Eiffel, Ada, and Lisp. It supports multiple programming paradigms, ' +
      'including functional, object-oriented, and imperative. It also has a dynamic type ' +
      'system and automatic memory management.'
    },
  
    {
      name: 'JavaScript',
      description: 'JavaScript is a high-level, dynamic, untyped, and interpreted ' +
      'programming language. It has been standardized in the ECMAScript language ' +
      'specification. Alongside HTML and CSS, JavaScript is one of the three core ' +
      'technologies of World Wide Web content production; the majority of websites employ ' +
      'it, and all modern Web browsers support it without the need for plug-ins. JavaScript ' +
      'is prototype-based with first-class functions, making it a multi-paradigm language, ' +
      'supporting object-oriented, imperative, and functional programming styles.'
    },
  
    {
      name: 'Lisp',
      description: 'Lisp (historically, LISP) is a family of computer programming languages ' +
      'with a long history and a distinctive, fully parenthesized prefix notation. ' +
      'Originally specified in 1958, Lisp is the second-oldest high-level programming ' +
      'language in widespread use today. Only Fortran is older, by one year. Lisp has changed ' +
      'since its early days, and many dialects have existed over its history. Today, the best '+
      'known general-purpose Lisp dialects are Common Lisp and Scheme.'
    },
  
    {
      name: 'Python',
      description: 'Python is a high-level, general purpose programming language.'
    }
  ];

  function shortenDescription(language) {
    return language.description.slice(0, 120) + ' ...';
  }

  Handlebars.registerHelper('short_description', function () {
    return shortenDescription(this);
  });

  Handlebars.registerHelper('has_long_description', function () {
    return this.description.length > 120;
  });

  function App() {
    this.languages = languages;
    this.languageTemplate = this.registerTemplate();
    this.generateLanguages();
    this.bindEvent();
  }
  
  App.prototype = {
    registerTemplate() {
      let scriptElement = document.querySelector('script[type="text/x-handlebars-template"][data-id="language"]');
      scriptElement.remove();
      return Handlebars.compile(scriptElement.innerHTML);
    },

    generateLanguages() {
      let container = document.querySelector('div[data-id="languages"]');

      this.languages.forEach(language => {
        container.insertAdjacentHTML('beforeend', this.languageTemplate(language));
      }, this);
    },

    showMore(button, paragraph, languageObj) {
      paragraph.textContent = languageObj.description;
      button.textContent = 'Show Less';
    },

    showLess(button, paragraph, languageObj) {
      paragraph.textContent = shortenDescription(languageObj);
      button.textContent = 'Show More';
    },

    handleButtonClick(event) {
      if (event.target.tagName !== 'BUTTON') return;

      let button = event.target;
      let paragraph = button.parentElement.querySelector('p');
      let language = button.parentElement.dataset.language;
      let languageObj = this.languages.find(l => l.name === language);

      if (event.target.textContent === 'Show More') {
        this.showMore(button, paragraph, languageObj);
      } else {
        this.showLess(button, paragraph, languageObj);
      }
    },

    bindEvent() {
      document.querySelector('div[data-id="languages"]').addEventListener('click', this.handleButtonClick.bind(this));
    },
  };

  new App();
});