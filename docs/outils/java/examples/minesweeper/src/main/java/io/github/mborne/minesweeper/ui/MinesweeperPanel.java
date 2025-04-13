package io.github.mborne.minesweeper.ui;

import java.awt.Dimension;
import java.awt.Graphics;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;

import javax.swing.JPanel;
import javax.swing.SwingUtilities;

import io.github.mborne.minesweeper.model.Cell;
import io.github.mborne.minesweeper.model.CellState;
import io.github.mborne.minesweeper.model.Game;
import io.github.mborne.minesweeper.model.Grid;

/**
 * Minesweeper panel rendering grid
 * @author mickael
 *
 */
public class MinesweeperPanel extends JPanel implements MouseListener {
	
	private Game game ;
	private int cellSize ;
	private ImageManager imageManager ;
	
	public MinesweeperPanel(Game game){
		this.cellSize = 24 ;
		this.game = game ;
		this.setSize(getPreferredSize());
		this.imageManager = new ImageManager();
		this.addMouseListener(this);
	}
	
	protected Grid getGrid(){
		return game.getGrid() ;
	}
	
	@Override
	public Dimension getPreferredSize() {
		return new Dimension(
			game.getGrid().getNumRows()*cellSize,
			game.getGrid().getNumCols()*cellSize
		);
	}
	
	
	@Override
	public void paintComponent(Graphics g) {
		super.paintComponent(g);

		Grid grid = game.getGrid() ;
		
		for ( int row = 0; row < grid.getNumRows(); row++ ){
			for ( int col = 0; col < grid.getNumCols(); col++ ){
				paintCell(g,row,col,grid.getCell(row, col)) ;
			}
		}
	}
	
	private void paintCell(Graphics g,int row, int col, Cell cell) {
		int x      = row*cellSize ;
		int y      = col*cellSize ; 
		int width  = cellSize ;
		int height = cellSize ;
		
		g.drawRect(x, y, cellSize, cellSize);

		g.drawImage(
			imageManager.getImage(cell.getState()), 
			x, y, width, height, 
			this
		);
		
		if ( cell.getState() == CellState.VISIBLE ){
			int digit = game.getGrid().getNumMinesAround(row,col) ;
			g.drawImage(
				imageManager.getDigitImage(digit), 
				x, y, width, height, 
				this
			);
		}
	}
	
	

	public void mouseClicked(MouseEvent e) {
		int row = ( e.getX() - 1 ) / ( cellSize ) ;
		int col = ( e.getY() - 1 ) / ( cellSize ) ;
		
		if ( SwingUtilities.isLeftMouseButton(e) ){
			game.open(row,col);
		}else if ( SwingUtilities.isRightMouseButton(e) ){
			game.toggleFlag(row,col);
		}
		repaint();
	}

	public void mouseEntered(MouseEvent e) {
	}

	public void mouseExited(MouseEvent e) {
	}

	public void mousePressed(MouseEvent e) {
	}

	public void mouseReleased(MouseEvent e) {
	}
	
}
