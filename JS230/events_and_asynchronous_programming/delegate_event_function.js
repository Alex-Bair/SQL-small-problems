function delegateEvent(parentElement, selector, eventType, callback) {
  if (!parentElement || !(parentElement instanceof Element)) return undefined;

  parentElement.addEventListener(eventType, event => {
    let childElements = [].slice.call(parentElement.querySelectorAll(selector));
    if (childElements.includes(event.target)) {
      callback(event);
    }
  });
  
  return true;
}