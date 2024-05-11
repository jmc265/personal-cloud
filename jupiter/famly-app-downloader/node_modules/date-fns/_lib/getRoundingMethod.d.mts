import type { RoundingMethod } from "../types.js";
export declare function getRoundingMethod(
  method: RoundingMethod | undefined,
): (x: number) => number;
