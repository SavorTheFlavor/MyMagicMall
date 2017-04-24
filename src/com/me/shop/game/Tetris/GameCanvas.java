package com.me.shop.game.Tetris;

import java.awt.*;
import javax.swing.*;
import javax.swing.border.EtchedBorder;
 		

class GameCanvas extends JPanel {
	private Color backColor = Color.black, frontColor = Color.gray;
	private int rows, cols, score = 0, scoreForLevelUpdate = 0;
	private ErsBox[][] boxes;
	private int boxWidth, boxHeight;

	
	public GameCanvas(int rows, int cols) {
		this.rows = rows;
		this.cols = cols;

		boxes = new ErsBox[rows][cols];
		for (int i = 0; i < boxes.length; i++) {
			for (int j = 0; j < boxes[i].length; j++) {
				boxes[i][j] = new ErsBox(false);
			}
		}

		setBorder(new EtchedBorder(
		        EtchedBorder.RAISED, Color.white, new Color(148, 145, 140)));
	}

	
	public GameCanvas(int rows, int cols,
	                  Color backColor, Color frontColor) {
		this(rows, cols);
		this.backColor = backColor;
		this.frontColor = frontColor;
	}

	
	public void setBackgroundColor(Color backColor) {
		this.backColor = backColor;
	}

	
	public Color getBackgroundColor() {
		return backColor;
	}

	
	public void setBlockColor(Color frontColor) {
		this.frontColor = frontColor;
	}

	
	public Color getBlockColor() {
		return frontColor;
	}

	
	public int getRows() {
		return rows;
	}

	
	public int getCols() {
		return cols;
	}

	
	public int getScore() {
		return score;
	}

	
	public int getScoreForLevelUpdate() {
		return scoreForLevelUpdate;
	}

	
	public void resetScoreForLevelUpdate() {
		scoreForLevelUpdate -= ErsBlocksGame.PER_LEVEL_SCORE;
	}

	
	public ErsBox getBox(int row, int col) {
		if (row < 0 || row > boxes.length - 1
		        || col < 0 || col > boxes[0].length - 1)
			return null;
		return (boxes[row][col]);
	}

	
	public void paintComponent(Graphics g) {
		super.paintComponent(g);

		g.setColor(frontColor);
		for (int i = 0; i < boxes.length; i++) {
			for (int j = 0; j < boxes[i].length; j++) {
				g.setColor(boxes[i][j].isColorBox() ? frontColor : backColor);
				g.fill3DRect(j * boxWidth, i * boxHeight,
				        boxWidth, boxHeight, true);
			}
		}
	}

	
	public void fanning() {
		boxWidth = getSize().width / cols;
		boxHeight = getSize().height / rows;
	}

	
	public synchronized void removeLine(int row) {
		for (int i = row; i > 0; i--) {
			for (int j = 0; j < cols; j++)
				boxes[i][j] = (ErsBox) boxes[i - 1][j].clone();
		}

		score += ErsBlocksGame.PER_LINE_SCORE;
		scoreForLevelUpdate += ErsBlocksGame.PER_LINE_SCORE;
		repaint();
	}

	
	public void reset() {
		score = 0;
		scoreForLevelUpdate = 0;
		for (int i = 0; i < boxes.length; i++) {
			for (int j = 0; j < boxes[i].length; j++)
				boxes[i][j].setColor(false);
		}

		repaint();
	}
}
