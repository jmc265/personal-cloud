export function getRoundingMethod(method) {
  return method ? Math[method] : Math.trunc;
}
