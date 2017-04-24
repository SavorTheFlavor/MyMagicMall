package com.me.shop.game.Tetris;

import java.awt.*;


class ErsBox implements Cloneable {
	private boolean isColor;
	private Dimension size = new Dimension();

	
	public ErsBox(boolean isColor) {
		this.isColor = isColor;
	}

	
	public boolean isColorBox() {
		return isColor;
	}

	
	public void setColor(boolean isColor) {
		this.isColor = isColor;
	}

	
	public Dimension getSize() {
		return size;
	}

	
	public void setSize(Dimension size) {
		this.size = size;
	}

	
	public Object clone() {
		Object cloned = null;
		try {
			cloned = super.clone();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return cloned;
	}
}
