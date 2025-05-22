package io.github.mborne.minesweeper.model;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Random;

/**
 * 
 * Cell grid
 * 
 * @author mickael
 *
 */
public class Grid {
	/**
	 * Grid with
	 */
	private int numCols;
	/**
	 * Grid height
	 */
	private int numRows;

	/**
	 * Grid cells [height][width]
	 */
	private List<Cell> cells;

	/**
	 * Constructor with a width and height
	 * 
	 * @param numRows
	 * @param numCols
	 */
	public Grid(int numRows, int numCols) {
		this.numCols = numRows;
		this.numRows = numCols;
		this.cells = new ArrayList<Cell>();
		for (int i = 0; i < numRows * numCols; i++) {
			this.cells.add(new Cell());
		}
	}

	/**
	 * Create a Matrix with numMines
	 * @param numRows
	 * @param numCols
	 * @param numMines
	 * @return
	 */
	public static Grid createGrid(int numRows, int numCols, int numMines){
		assert( numMines < numRows * numCols );
		
		Grid result = new Grid(numRows,numCols);
	    for ( int i = 0; i < numMines; i++ ){
			Cell cell = result.findRandomNotMinedCell();
			cell.setMined(true);
	    }
		return result;
	}

	/**
	 * Get number of rows
	 * @return
	 */
	public int getNumRows() {
		return numRows;
	}
	
	/**
	 * Get number of columns
	 * @return
	 */
	public int getNumCols() {
		return numCols;
	}

	/**
	 * Test if cell exists
	 * @param row
	 * @param col
	 * @return
	 */
	public boolean hasCell(int row, int col) {
		if (row < 0 || row >= numRows) {
			return false;
		}
		if (col < 0 || col >= numCols) {
			return false;
		}
		return true;
	}

	/**
	 * Get cell (null if not found)
	 * @param row
	 * @param col
	 * @return
	 */
	public Cell getCell(int row, int col) {
		if (!hasCell(row, col)) {
			return null;
		}
		return cells.get(row * numCols + col);
	}

	/**
	 * Get all cells
	 * @return
	 */
	public Collection<Cell> getCells() {
		return cells;
	}

	public Cell getCell(int index) {
		return cells.get(index);
	}

	/**
	 * Renvoie le nombre de mines autour de row,col
	 * 
	 * @param row
	 * @param col
	 * @return
	 */
	public int getNumMinesAround(int row, int col) {
		int count = 0;
		for (int i = row - 1; i <= row + 1; i++) {
			for (int j = col - 1; j <= col + 1; j++) {
				if (i == row && j == col) {
					continue;
				}

				Cell cell = getCell(i, j);
				if (cell == null) {
					continue;
				}

				if (cell.isMined()) {
					count += 1;
				}
			}
		}
		return count;
	}

	/**
	 * Comptage des bombes
	 * 
	 * @return
	 */
	public int getNumMines() {
		int result = 0;
		for (Cell cell : cells) {
			if (cell.isMined()) {
				result++;
			}
		}
		return result;
	}

	/**
	 * Comptage des flags
	 * 
	 * @return
	 */
	public int getNumFlags() {
		int result = 0;
		for (Cell cell : cells) {
			if (cell.getState() == CellState.FLAGGED) {
				result++;
			}
		}
		return result;
	}


	/**
	 * Find a random not mined cell
	 * 
	 * FIXME candidates to make it safe
	 * 
	 * @return
	 */
	private Cell findRandomNotMinedCell(){
		Random random = new Random();

		Cell result = null ;
		do {
			result = getCell(
				random.nextInt( getCells().size() ) 
			) ;
		} while ( result.isMined() ) ;
		
		return result ;
	}
	
	
}
