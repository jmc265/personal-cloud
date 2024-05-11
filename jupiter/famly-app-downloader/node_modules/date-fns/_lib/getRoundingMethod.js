"use strict";
exports.getRoundingMethod = getRoundingMethod;

function getRoundingMethod(method) {
  return method ? Math[method] : Math.trunc;
}
