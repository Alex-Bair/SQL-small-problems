function nodesToArr(node = document.body) {
  if (node.length === 0) return [];

  return [node.tagName, [...node.children].map(nodesToArr)];
}