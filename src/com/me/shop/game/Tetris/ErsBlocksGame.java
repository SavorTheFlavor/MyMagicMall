package com.me.shop.game.Tetris;



import javax.swing.*;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.me.shop.dao.UserDao;
import com.me.shop.service.UserService;
import com.me.shop.vo.User;

import java.awt.*;
import java.awt.event.*;


public class ErsBlocksGame extends JFrame {
	public final static int PER_LINE_SCORE = 100;
	public final static int PER_LEVEL_SCORE = PER_LINE_SCORE * 20;
	public final static int MAX_LEVEL = 10;
	public final static int DEFAULT_LEVEL = 0;
	private GameCanvas canvas;
	private ErsBlock block;
	private boolean playing = false;
	private ControlPanel ctrlPanel;

	private JMenuBar bar = new JMenuBar();
	
	private JMenuItem 
			miPlay = new JMenuItem("Play"),
			miPause = new JMenuItem("Pause"),
			miResume = new JMenuItem("Resume"),
			miStop = new JMenuItem("Stop");
	public ErsBlocksGame(String title) {
		super(title);
		setSize(315, 392);
		Dimension scrSize = Toolkit.getDefaultToolkit().getScreenSize();
		setLocation((scrSize.width - getSize().width) / 2,
		        (scrSize.height - getSize().height) / 2);


		Container container = getContentPane();
		container.setLayout(new BorderLayout(6, 0));

		canvas = new GameCanvas(20, 12);
		ctrlPanel = new ControlPanel(this);

		container.add(canvas, BorderLayout.CENTER);
		container.add(ctrlPanel, BorderLayout.EAST);

		addComponentListener(new ComponentAdapter() {
			public void componentResized(ComponentEvent ce) {
				canvas.fanning();
			}
		});

        show();
		canvas.fanning();
	}

	public void reset() {
		ctrlPanel.reset();
		canvas.reset();
	}

	public boolean isPlaying() {
		return playing;
	}

	public ErsBlock getCurBlock() {
		return block;
	}

	public GameCanvas getCanvas() {
		return canvas;
	}

	public void playGame() {
		play();
		ctrlPanel.setPlayButtonEnable(false);
		miPlay.setEnabled(false);
		ctrlPanel.requestFocus();
	}

	public void pauseGame() {
		if (block != null) block.pauseMove();

		ctrlPanel.setPauseButtonLabel(false);
		miPause.setEnabled(false);
		miResume.setEnabled(true);
	}

	public void resumeGame() {
		if (block != null) block.resumeMove();
		ctrlPanel.setPauseButtonLabel(true);
		miPause.setEnabled(true);
		miResume.setEnabled(false);
		ctrlPanel.requestFocus();
	}
	public void stopGame() {
		playing = false;
		if (block != null) block.stopMove();
		miPlay.setEnabled(true);
		miPause.setEnabled(true);
		miResume.setEnabled(false);
		ctrlPanel.setPlayButtonEnable(true);
		ctrlPanel.setPauseButtonLabel(true);
	}

	public int getLevel() {
		return ctrlPanel.getLevel();
	}

	public void setLevel(int level) {
		if (level < 11 && level > 0) ctrlPanel.setLevel(level);
	}
	public int getScore() {
		if (canvas != null) return canvas.getScore();
		return 0;
	}

	public int getScoreForLevelUpdate() {
		if (canvas != null) return canvas.getScoreForLevelUpdate();
		return 0;
	}


	public boolean levelUpdate() {
		int curLevel = getLevel();
		if (curLevel < MAX_LEVEL) {
			setLevel(curLevel + 1);
			canvas.resetScoreForLevelUpdate();
			return true;
		}
		return false;
	}

	
	private void play() {
		reset();
		playing = true;
		Thread thread = new Thread(new Game());
		thread.start();
	}

	
	private void reportGameOver() {
		JOptionPane.showMessageDialog(this, "Game Over!  \n\n你从游戏中获得了"+this.getScore()/5+"点积分！");
	}

	private class Game implements Runnable {
		public void run() {
			int col = (int) (Math.random() * (canvas.getCols() - 3)),
			        style = ErsBlock.STYLES[(int) (Math.random() * 7)][(int) (Math.random() * 4)];

			while (playing) {
				if (block != null) {    
					if (block.isAlive()) {
						try {
							Thread.currentThread().sleep(100);
						} catch (InterruptedException ie) {
							ie.printStackTrace();
						}
						continue;
					}
				}

				checkFullLine();       

				if (isGameOver()) {    
					miPlay.setEnabled(true);
					miPause.setEnabled(true);
					miResume.setEnabled(false);
					ctrlPanel.setPlayButtonEnable(true);
					ctrlPanel.setPauseButtonLabel(true);

					reportGameOver();
					return;
				}

				block = new ErsBlock(style, -1, col, getLevel(), canvas);
				block.start();

				col = (int) (Math.random() * (canvas.getCols() - 3));
				style = ErsBlock.STYLES[(int) (Math.random() * 7)][(int) (Math.random() * 4)];

				ctrlPanel.setTipStyle(style);
			}
		}

		
		public void checkFullLine() {
			for (int i = 0; i < canvas.getRows(); i++) {
				int row = -1;
				boolean fullLineColorBox = true;
				for (int j = 0; j < canvas.getCols(); j++) {
					if (!canvas.getBox(i, j).isColorBox()) {
						fullLineColorBox = false;
						break;
					}
				}
				if (fullLineColorBox) {
					row = i--;
					canvas.removeLine(row);
				}
			}
		}

		
		private boolean isGameOver() {
			for (int i = 0; i < canvas.getCols(); i++) {
				ErsBox box = canvas.getBox(0, i);
				if (box.isColorBox()) return true;
			}
			return false;
		}
	}


}
