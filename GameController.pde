/*
 * Updates game and handles user input
 * Manages game state transitions
 */

import javax.swing.*;

public class GameController implements Serializable {
  
  private GameGrid grid;
  private GameView gameView;
  private GameState gameState;
  private HighScoreController highScoreController;
  
  
  // Constructor for GameController
  public GameController(GameGrid grid, GameView gameView, HighScoreController highScoreController) {
    this.grid = grid;
    this.gameView = gameView;
    this.highScoreController = highScoreController;
    gameState = GameState.START;
  }
  
  public void start() {
    gameView.drawStart();
    if (keyPressed) {
      if (key == 'p' || key == 'P') {
        gameState = GameState.PLAY;
      }
      else if (key == 'h' || key == 'H') {
        gameState = GameState.HIGH_SCORES;
      }
    }
  }
  
  public void showHighScores() {
    gameView.drawHighScores();
    if (keyPressed) {
      if (key == 'r' || key == 'R') {
        gameState = GameState.START;
      }
    }
  }
  
  /*
   * Calls game grid to update game and check if it can continue
   */
  public void play() {
    // Set directionChange to false so that the snake can change direction once every update
    grid.headingChanged = false;
    // Check if game can continue by updating the game with new snake position based on current heading.
    if(grid.canContinue()) {
      gameView.draw();
    }
    // Game over man!
    else {
      gameState = GameState.GAME_OVER;
    } 
  }
  
  /* 
   * Display an input dialoge box when a game is lost
   * Add player name and score to high score list and save to file
   */
  public void gameOver() {
    String name = JOptionPane.showInputDialog("Game Over man!\n\nYour score: " + grid.getScore() + "\n\nPlease enter your name: ");
    // Only add new score to list if player entered a name
    if (name != null && name.length() > 0) {
      highScoreController.addScore(name, grid.getScore());
      println(highScoreController.getHighScoreString());
    }
    resetGame();
  }
  
  /*
   * Handle user input
   */
  public void keyPressed() {
    // Only allow if direction has not changed already this update
    if (!grid.headingChanged) {
      // Check if the key pressed is coded
      if (key == CODED) {
        switch (keyCode) {
          case UP:
            grid.changeHeading(Heading.UP);
            break;
          case DOWN:
            grid.changeHeading(Heading.DOWN);
            break;
          case LEFT:
            grid.changeHeading(Heading.LEFT);
            break;
          case RIGHT:
            grid.changeHeading(Heading.RIGHT);
            break;
          default:
            break;
        }
      }
    }
  }
  
  /*
   * Reset the game so we can start a new one
   * A new game grid is initialised so score etc is reset
   */
  public void resetGame() {
    grid = new GameGrid(30, 30);
    gameView.setGameGrid(grid);
    gameState = GameState.START;
  }
  
  public GameGrid getGameGrid() {
    return grid;
  }
  
  public GameState getGameState() {
    return gameState;
  }
  
  public void setGameState(GameState gameState) {
    this.gameState = gameState;
  }
  
}