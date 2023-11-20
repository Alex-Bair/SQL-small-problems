function myBind(func, context, partialArgs) {
  return function(...args) {
    const fullArgs = partialArgs.concat(args);

    return func.apply(context, fullArgs);
  };
}