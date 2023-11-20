function arrayToNodes(nodes) {
  let parentNode = document.createElement(nodes[0]);

  nodes[1].forEach(childArr => {
    parentNode.appendChild(arrayToNodes(childArr));
  });

  return parentNode;
}