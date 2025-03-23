package io.github.mborne.minesweeper.ui;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.imageio.ImageIO;

import io.github.mborne.minesweeper.model.CellState;

public class ImageManager {

	private Map<CellState, BufferedImage> stateImages = new HashMap<CellState, BufferedImage>();
	private BufferedImage[] digitImages = new BufferedImage[9];

	public ImageManager() {
		stateImages.put(CellState.HIDDEN, loadImage("/hidden.png"));
		stateImages.put(CellState.FLAGGED, loadImage("/flagged.png"));
		stateImages.put(CellState.EXPLODED, loadImage("/exploded.png"));
		stateImages.put(CellState.VISIBLE, loadImage("/visible.png"));

		for (int digit = 0; digit <= 8; digit++) {
			String name = "/digit_" + digit + ".png";
			digitImages[digit] = loadImage(name);
		}
	}

	public BufferedImage getImage(CellState state) {
		return stateImages.get(state);
	}

	public BufferedImage getDigitImage(int digit) {
		return digitImages[digit];
	}

	private BufferedImage loadImage(String name) {
		try {
			return ImageIO.read(getClass().getResourceAsStream(name));
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
	}

}
