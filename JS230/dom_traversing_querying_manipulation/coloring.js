function colorGeneration(targetGenNum) {
  if (targetGenNum === 0) return;

  let generation = [document.body];

  for (let currentGenNum = 1; currentGenNum <= targetGenNum; currentGenNum += 1) {
    generation = generation.flatMap(parent => [].slice.call(parent.children));
    if (generation.length === 0) break;
  }

  generation.forEach(node => node.classList.add('generation-color'));
}