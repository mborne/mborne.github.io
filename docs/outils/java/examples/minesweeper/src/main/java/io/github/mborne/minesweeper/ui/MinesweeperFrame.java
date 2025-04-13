package io.github.mborne.minesweeper.ui;

import java.awt.BorderLayout;

import javax.swing.JFrame;
import javax.swing.JLabel;

import io.github.mborne.minesweeper.model.Cell;
import io.github.mborne.minesweeper.model.Game;
import io.github.mborne.minesweeper.model.GameListener;

/**
 * 
 * Minesweeper window
 * 
 * @author mickael
 *
 */
public class MinesweeperFrame extends JFrame implements GameListener {
	private static final long serialVersionUID = 1L;

	private JLabel status ;
	private MinesweeperPanel panel ;
	
	public MinesweeperFrame(Game game){
		this.status = new JLabel(game.getState().toString()) ;
		this.panel = new MinesweeperPanel(game) ;

		setLayout(new BorderLayout());
		add(status, BorderLayout.NORTH);
		add(panel, BorderLayout.CENTER);
		pack();
		
		game.addListener(this);
		
		this.setResizable(false);
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	}

	public void onCellChange(Game game, Cell cell) {
		status.setText(game.getState().toString());
	}

}
