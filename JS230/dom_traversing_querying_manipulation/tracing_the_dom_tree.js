function domTreeTracer(id) {
  let startNode = document.getElementById(id);
  let treeArray = [[startNode]];
  
  buildOutTree(treeArray);
  
  return formatTreeArr(treeArray);
}

function buildOutTree(arr) {
  while (isNotEndOfTree(arr.at(-1)[0])) {
    arr.push([arr.at(-1)[0].parentNode]);
    arr[arr.length - 1] = getSiblings(arr.at(-1)[0]);
  }
}

function isNotEndOfTree(node) {
  return node.id !== '1';
}

function getSiblings(node) {
  return getPreviousSiblings(node).concat([node]).concat(getNextSiblings(node));
}

function getPreviousSiblings(node) {
  let prevSib = node.previousElementSibling;
  if (prevSib) {
    return getPreviousSiblings(prevSib).concat([prevSib]);
  } else {
    return [];
  }
}

function getNextSiblings(node) {
  let nextSib = node.nextElementSibling;
  if (nextSib) {
    return [nextSib].concat(getNextSiblings(nextSib));
  } else {
    return [];
  }
}

function formatTreeArr(arr) {
  return arr.map(subarr => subarr.map(node => node.tagName));
}

/*

LS Solution

function domTreeTracer(id) {
  let currentElement = document.getElementById(id);
  let parentElement;
  const domTree = [];

  do {
    parentElement = currentElement.parentNode;
    let children = getTagNames(parentElement.children);
    domTree.push(children);

    currentElement = parentElement;
  } while (parentElement.tagName !== 'BODY');

  return domTree;
}

function getTagNames(htmlCollection) {
  const elementsArray = Array.from(htmlCollection);
  return elementsArray.map(({tagName}) => tagName);
}

*/