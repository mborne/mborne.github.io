package io.github.mborne.minesweeper.model;

import java.util.List;
import java.util.ArrayList;

/**
 * 
 * Implement game logics
 * 
 * TODO getState / updateState
 * 
 * @author mickael
 *
 */
public class Game {
	
	/**
	 * The cell grid
	 */
	private Grid grid ;
	
	/**
	 * The game state
	 */
	private GameState state ;
	
	private List<GameListener> listeners = new ArrayList<GameListener>();

	/**
	 * Construction à partir d'une taille
	 * @param width
	 * @param height
	 */
	public Game(Grid grid){
		this.grid  = grid ;
		this.state = computeState();
	}
	
	/**
	 * Get grid
	 * @return
	 */
	public Grid getGrid() {
		return grid;
	}
	
	/**
	 * Get game state
	 * @return
	 */
	public GameState getState(){
		return this.state;
	}
	

	/**
	 * Add a listener
	 * @param listener
	 */
	public void addListener(GameListener listener) {
		listeners.add(listener);
	}
	
	/**
	 * update game state and notify listeners
	 * @param cell
	 */
	protected void onCellChange(Cell cell){
		this.state = computeState();
		for (GameListener gameListener : listeners) {
			gameListener.onCellChange(this,cell);
		}
	}

	
	/**
	 * @return the state
	 */
	public GameState computeState() {
		/*
		 * test if a cell is exploded
		 */
		for (Cell cell : grid.getCells()) {
			if ( cell.getState().equals(CellState.EXPLODED) ){
				return GameState.LOST;
			}
		}
		
		int numMines = grid.getNumMines();
		int numCorrectFlags = 0;
		for (Cell cell : grid.getCells()) {
			if ( cell.isMined() && cell.getState().equals(CellState.FLAGGED) ){
				numCorrectFlags++;
			}
		}
		if ( numCorrectFlags == numMines ){
			return GameState.WIN;
		}
		
		
		return GameState.RUNNING;
	}


	/**
	 * Open cell
	 * @param row
	 * @param col
	 */
	public void open(int row, int col) {
		if ( state != GameState.RUNNING ){
			return ;
		}
		
		Cell cell = grid.getCell(row,col);
		if ( cell == null ){
			return ;
		}
		
		if ( cell.getState() != CellState.HIDDEN ){
			return ;
		}
		
		if ( cell.isMined() ){
			cell.setState(CellState.EXPLODED) ;
			onCellChange(cell);
		}else{
			cell.setState(CellState.VISIBLE);
			onCellChange(cell);
			if ( grid.getNumMinesAround(row, col) == 0 ){
				openAround(row,col);
			}
		}
	}
	
	/**
	 * Open cells around (row,col)
	 * @param row
	 * @param col
	 */
	private void openAround(int row, int col) {
		for ( int i = row - 1; i <= row + 1; i++ ){
			for ( int j = col - 1; j <= col + 1; j++ ){
				open(i,j);
			}
		}
	}

	/**
	 * Flag/unflag une cellule
	 * @param row
	 * @param col
	 */
	public void toggleFlag(int row, int col) {
		if ( state != GameState.RUNNING ){
			return ;
		}

		Cell cell = grid.getCell(row,col);
		if ( cell == null ){
			return ;
		}
		
		if ( cell.getState() == CellState.HIDDEN ){
			if ( grid.getNumFlags() < grid.getNumMines() ){	
				cell.setState(CellState.FLAGGED);
				onCellChange(cell);
			}
		}else if ( cell.getState() == CellState.FLAGGED ){
			cell.setState(CellState.HIDDEN);
			onCellChange(cell);
		}
	}
	
	
}
