package io.github.mborne.minesweeper.model;

/**
 * 
 * Représente l'état d'une cellule
 * 
 * @author mickael
 *
 */
public enum CellState {
	/**
	 * La cellule est masquée
	 */
	HIDDEN,
	/**
	 * La cellule est visible
	 */
	VISIBLE,
	/**
	 * La cellule est marquée d'un drapeau
	 */
	FLAGGED,
	/**
	 * La cellule contient une bombe qui a explosé
	 */
	EXPLODED,
}
