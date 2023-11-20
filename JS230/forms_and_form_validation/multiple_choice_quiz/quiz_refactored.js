// refactoring quiz.js to follow OOP approach of LS solution
document.addEventListener('DOMContentLoaded', event => {
  const questions = [
    {
      id: 1,
      description: "Which Pokémon is a Ghost type??",
      options: ['Dewott', 'Fidough', 'Cyndaquil', 'Banette'],
    },
    {
      id: 2,
      description: 'What is Gholdengo\'s signature move?',
      options: ['Tackle', 'Power Gem', 'Make It Rain', 'Low Sweep'],
    },
    {
      id: 3,
      description: 'Who won the Pokémon 2023 NAIC VGC Juniors Division?',
      options: ['Wolfe G.', 'Takumi M.', 'Avery V.', 'Justin T.', 'Alex B.'],
    },
    {
      id: 4,
      description: 'The "Maus" in "MausApe" refers to which Pokémon?',
      options: ['Pikachu', 'Morpeko', 'Tandemaus', 'Maushold'],
    },
  ];

  const answerKey = { '1': 'Banette', '2': 'Make It Rain', '3': 'Avery V.', '4': 'Maushold' };

  function App() {
    this.questions = questions;
    this.answerKey = answerKey;
    this.form = document.querySelector('form');
    this.numberCorrect = 0;
    this.questionTemplate = Handlebars.compile(document.getElementById('question').innerHTML)
    this.renderQuestions();
    this.bindEvents();
  }
  
  App.prototype = {
    renderQuestions() {
      this.questions.forEach(function(question) {
        document.querySelector('fieldset').insertAdjacentHTML('beforeend', this.questionTemplate(question));
      }.bind(this));
    },

    markQuestion(element) {
      let questionId = element.id;
      let submittedAnswer = element.querySelector('input:checked');
      if (submittedAnswer) submittedAnswer = submittedAnswer.value;
      let result = element.querySelector('.result');
      let correctAnswer = this.answerKey[questionId];

      if (!submittedAnswer) {
        this.markUnanswered(result, correctAnswer);
      } else if (submittedAnswer === correctAnswer) {
        this.markCorrect(result);
      } else {
        this.markWrong(result, correctAnswer);
      }
    },

    markCorrect(result) {
      result.textContent = 'Correct answer.';
      result.classList.add('correct');
      this.numberCorrect += 1;
    },

    markWrong(result, correctAnswer) {
      result.textContent = `Wrong answer. Correct answer is "${correctAnswer}".`;
      result.classList.add('wrong');
    },

    markUnanswered(result, correctAnswer) {
      result.textContent = `You did not answer this question. Correct answer is: "${correctAnswer}".`;
      result.classList.add('wrong');
    },

    markQuiz() {
      let self = this;
      document.querySelectorAll('div.question').forEach(input => self.markQuestion(input));
    },

    insertImage() {
      const banette = `<a id='result_image' href="https://pokemondb.net/pokedex/banette"><img src="https://img.pokemondb.net/sprites/black-white/anim/normal/banette.gif" alt="Banette"></a>`;
      const banetteMessage = `<span id='result_text'>Banette isn't happy you got them all wrong!</span>`;
      const exeggcute = `<a id='result_image' href="https://pokemondb.net/pokedex/exeggcute"><img src="https://img.pokemondb.net/sprites/black-white/anim/normal/exeggcute.gif" alt="Exeggcute"></a>`;
      const exeggcuteMessage = `<span id='result_text'>You're a smart egg getting them all right!</span>`;
      const rowlett = `<a id='result_image' href="https://pokemondb.net/pokedex/rowlet"><img src="https://img.pokemondb.net/sprites/scarlet-violet/normal/rowlet.png" alt="Rowlet"></a>`;
      const rowlettMessage = `<span id='result_text'>It wouldn't be a bad idea to study a little more with Rowlett!</span>`;
    
      if (this.numberCorrect === 0) {
        this.form.insertAdjacentHTML('afterend', banette + banetteMessage);
      } else if (this.numberCorrect === questions.length) {
        this.form.insertAdjacentHTML('afterend', exeggcute + exeggcuteMessage);
      } else {
        this.form.insertAdjacentHTML('afterend', rowlett + rowlettMessage);
      }
    },

    resetForm(event) {
      event.preventDefault();
      let results = document.querySelectorAll('.result');
      document.querySelector('form').reset();
      event.target.disabled = true;

      results.forEach(result => {
        result.textContent = '';
        result.classList.remove('correct', 'wrong');
      });

      this.numberCorrect = 0;

      if (document.getElementById('result_image')) {
        document.getElementById('result_image').remove();
        document.getElementById('result_text').remove();
      }

      document.querySelector('button').disabled = false;
    },

    handleSubmit(event) {
      let submitButton = event.target;
      event.preventDefault();

      this.markQuiz();
      this.insertImage();
      submitButton.disabled = true;
      document.querySelector('input[type="reset"]').disabled = false;
    },

    bindEvents() {
      document.querySelector('button').addEventListener('click', this.handleSubmit.bind(this));
      document.querySelector('input[type="reset"]').addEventListener('click', this.resetForm.bind(this));
    }
  };

  new App();
})