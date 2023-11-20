function sliceTree(parentId, childId) {
  let endNode = document.getElementById(parentId);
  let currentNode = document.getElementById(childId);
  if (!endNode || !currentNode) return undefined;

  let tree = [];

  while (currentNode !== endNode && currentNode){
    tree.unshift(currentNode.tagName);
    currentNode = currentNode.parentNode;
  }

  if (!currentNode) {
    return undefined;
  } else {
    tree.unshift(currentNode.tagName);
  }

  return tree;
}


sliceTree(1, 4);    // ["ARTICLE", "HEADER", "SPAN", "A"]
sliceTree(1, 76);   // undefined
sliceTree(2, 5);    // udnefined
sliceTree(5, 4);    // undefined
sliceTree(1, 23);   // ["ARTICLE", "FOOTER"]
sliceTree(1, 22);   // ["ARTICLE", "MAIN", "SECTION", "P", "SPAN", "STRONG", "A"]
sliceTree(11, 19);  // ["SECTION", "P", "SPAN", "STRONG", "A"]