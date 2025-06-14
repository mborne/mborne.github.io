package io.github.mborne.minesweeper.model;

/**
 * Allows to listen game change
 * @author mickael
 *
 */
public interface GameListener {

	public void onCellChange(Game game, Cell cell);
	
}
