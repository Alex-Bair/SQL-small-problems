function makeBold(element, func) {
  element.style.fontWeight = 'bold';

  if (func && typeof func === 'function') {
    func(element);
  }
}

// Further Exploration

// LS Solution

const sectionElement = document.querySelector('section');

function makeBold(element) {
  element.style.fontWeight = 'bold';
  const event = new CustomEvent('bolded');

  element.dispatchEvent(event);
}

sectionElement.addEventListener('bolded', (event) => {
  alert(event.target.tagName);
  event.target.classList.add('highlight');
});

makeBold(sectionElement);