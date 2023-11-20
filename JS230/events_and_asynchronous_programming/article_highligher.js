let body = document.body;
let main = document.body.querySelector('main');

function addHighlight(element) {
  let highlightedElement = document.querySelector('.highlight');
  if (highlightedElement) highlightedElement.classList.remove('highlight');
  element.classList.add('highlight');
}

document.querySelector('ul').addEventListener('click', event => {
  if (event.target.tagName === 'A') {
    event.stopPropagation();
    let articleSelector = event.target.getAttribute('href');
    let article = document.querySelector(articleSelector);
    addHighlight(article);
  }
});

main.addEventListener('click', event => {
  let clickedElement = event.target;
  if (clickedElement.tagName !== 'ARTICLE') clickedElement = clickedElement.parentElement;
 
   if (clickedElement.tagName === 'ARTICLE') {
     event.stopPropagation();
     addHighlight(clickedElement);
   }
});

body.addEventListener('click', event => {
  addHighlight(main);
});