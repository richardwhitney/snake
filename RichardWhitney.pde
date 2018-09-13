 /*
 * Name: Richard Whitney
 * Student Number: 20040645
 * 
 */

private GameView gameView;
private GameController gameController;
private HighScoreController highScoreController;

void setup() {
  size(450, 480);
  background(156);
  frameRate(60);
  GameGrid grid = new GameGrid(30, 30);
  highScoreController = new HighScoreController();
  gameView = new GameView(grid, highScoreController);
  gameController = new GameController(grid, gameView, highScoreController);
  
  
}

/* 
 * Main loop for game
 * Different actions taken depending on current game state
 */
void draw() {
  switch (gameController.getGameState()) {
    case START:
      gameController.start();
      break;
    case PLAY:
      // Only update game every 10 frames
      if (frameCount % 10 == 0) {
        background(125);
        gameController.play();
      }
      break;
    case GAME_OVER:
      gameController.gameOver();
      break;
    case HIGH_SCORES:
      gameController.showHighScores();
      break;
  }
   //<>//
}

void keyPressed() {
  gameController.keyPressed();
}