function areDirectlyRelated(node1, node2) {
  return (isChildOf(node1, node2) || isChildOf(node2, node1));
}

function isChildOf(child, parent) {
  let value = false;

  while (child && parent !== child) {
    if (child.parentNode === parent) value = true;
    child = child.parentNode;
  }

  return value;
}

function nodeSwap(id1, id2) {
  let node1 = document.getElementById(id1);
  let node2 = document.getElementById(id2);

  if (!node1 || !node2 || areDirectlyRelated(node1, node2)) return undefined;

  node2.insertAdjacentElement('beforebegin', node1.cloneNode(true));
  node1.insertAdjacentElement('beforebegin', node2);
  node1.remove();
}

// Further Exploration

// function nodeSwap(id1, id2) {
//   let node1 = document.getElementById(id1);
//   let node2 = document.getElementById(id2);

//   let placeholderNode = document.createElement('placholder');

//   if (!node1 || !node2 || areDirectlyRelated(node1, node2)) return undefined;

//   node2.insertAdjacentElement('beforebegin', placeholderNode);
//   node1.parentNode.replaceChild(node2, node1);
//   placeholderNode.parentNode.replaceChild(node1, placeholderNode);
// }