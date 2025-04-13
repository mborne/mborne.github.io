package io.github.mborne.minesweeper.model;

/**
 * Représente un case d'une partie de déminineur
 * 
 * @author mickael
 *
 */
public class Cell {

	/**
	 * Indique si la cellule est cachée
	 */
	private CellState state;

	/**
	 * Indique si une bombe est présente sur la cellule
	 */
	private boolean mined;

	/**
	 * Construction d'une cellule avec les valeurs par défaut :
	 * <ul>
	 * <li>state : CellState.HIDDEN</li>
	 * <li>mined : false</li>
	 * </ul>
	 * 
	 */
	public Cell() {
		reset();
	}

	public void reset() {
		this.state = CellState.HIDDEN;
		this.mined = false;
	}

	public boolean isMined() {
		return mined;
	}

	public void setMined(boolean mined) {
		this.mined = mined;
	}

	public CellState getState() {
		return state;
	}

	public void setState(CellState state) {
		this.state = state;
	}

}
