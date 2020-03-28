/* tslint:disable */
/* eslint-disable */
/**
*/
export enum Cell {
  Dead,
  Alive,
}
export class Universe {
  free(): void;
/**
* @returns {Universe} 
*/
  static new(): Universe;
/**
* @param {number} row 
* @param {number} col 
*/
  toggle_cell(row: number, col: number): void;
/**
* @returns {string} 
*/
  render(): string;
/**
*/
  tick(): void;
/**
* @returns {number} 
*/
  width(): number;
/**
* Set the width of the universe
*
* Resets all cells to their dead state.
* @param {number} width 
*/
  set_width(width: number): void;
/**
* @returns {number} 
*/
  height(): number;
/**
* Set the height of the universe
*
* Resets all cells to their dead state.
* @param {number} height 
*/
  set_height(height: number): void;
/**
* @returns {number} 
*/
  cells(): number;
}
