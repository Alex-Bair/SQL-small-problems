document.addEventListener('DOMContentLoaded', event => {
  // Quiz questions and answer key
  const questions = [
    {
      id: 1,
      description: "Which Pokémon is a ghost type??",
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
  const templates = {};

  // Frequently accessed elements

  let form = document.querySelector('form');
  let fieldset = form.querySelector('fieldset');
  let submitButton = form.querySelector('button');
  let resetButton = form.querySelector('input[type="reset"]');

  // compile and use Handlebars templates
  document.querySelectorAll('script[type="text/x-handlebars-template"]').forEach(template => {
    templates[template.id] = Handlebars.compile(template.innerHTML);
  });

  questions.forEach(q => {
    let questionHTML = templates.question(q);
    fieldset.insertAdjacentHTML('beforeend', questionHTML);
  });

  //event listeners for submitting quiz and reseting quiz

  let resultParagraphs = form.querySelectorAll('p.result');

  function gradeQuiz(submittedAnswers) {
    let numberCorrect = 0;

    resultParagraphs.forEach((result, index) => {
      let questionId = index + 1;
      let submittedAnswer = submittedAnswers.get(questionId);
      let correctAnswer = answerKey[questionId];

      if (!submittedAnswer) {
        result.textContent = `You did not answer this question. Correct answer is: "${correctAnswer}".`;
        result.classList.add('wrong');
      } else if (submittedAnswer === correctAnswer) {
        result.textContent = 'Correct answer.';
        result.classList.add('correct');
        numberCorrect += 1;
      } else {
        result.textContent = `Wrong answer. Correct answer is "${correctAnswer}".`;
        result.classList.add('wrong');
      }
    });

    insertImage(numberCorrect, resultParagraphs.length);
  }

  function insertImage(numberCorrect, numberTotal) {
    const banette = `<a id='result_image' href="https://pokemondb.net/pokedex/banette"><img src="https://img.pokemondb.net/sprites/black-white/anim/normal/banette.gif" alt="Banette"></a>`;
    const banetteMessage = `<span id='result_text'>Banette isn't happy you got them all wrong!</span>`;
    
    const exeggcute = `<a id='result_image' href="https://pokemondb.net/pokedex/exeggcute"><img src="https://img.pokemondb.net/sprites/black-white/anim/normal/exeggcute.gif" alt="Exeggcute"></a>`;
    const exeggcuteMessage = `<span id='result_text'>You're a smart egg getting them all right!</span>`;
    
    const rowlett = `<a id='result_image' href="https://pokemondb.net/pokedex/rowlet"><img src="https://img.pokemondb.net/sprites/scarlet-violet/normal/rowlet.png" alt="Rowlet"></a>`;
    const rowlettMessage = `<span id='result_text'>It wouldn't be a bad idea to study a little more with Rowlett!</span>`;
  
  
    if (numberCorrect === 0) {
      form.insertAdjacentHTML('afterend', banette + banetteMessage);
    } else if (numberCorrect === numberTotal) {
      form.insertAdjacentHTML('afterend', exeggcute + exeggcuteMessage);
    } else {
      form.insertAdjacentHTML('afterend', rowlett + rowlettMessage);
    }
  }

  function clearResults() {
    resultParagraphs.forEach(result => {
      result.textContent = '';
      result.classList.remove('correct', 'wrong');
    });
    
    if (document.getElementById('result_image')) {
      document.getElementById('result_image').remove();
      document.getElementById('result_text').remove();
    }
  }

  form.addEventListener('submit', event => {
    event.preventDefault();
    submitButton.disabled = true;
    resetButton.disabled = false;

    let submittedAnswers = new FormData(form);

    gradeQuiz(submittedAnswers);
  });

  form.addEventListener('reset', event => {
    submitButton.disabled = false;
    resetButton.disabled = true;
    clearResults();
  });

  form.dispatchEvent(new Event('reset'));
});
