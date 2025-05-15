package io.github.mborne.minesweeper;

import io.github.mborne.minesweeper.model.Game;
import io.github.mborne.minesweeper.model.Grid;
import io.github.mborne.minesweeper.ui.MinesweeperFrame;

public class Application {

	public static void main(String[] args) {
		Grid matrix = Grid.createGrid(20, 20, 10);
		Game game = new Game(matrix);
		MinesweeperFrame frame = new MinesweeperFrame(game);
		frame.setVisible(true);
	}

}
