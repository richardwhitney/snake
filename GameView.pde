/*
 * Responsible for drawing everything to the screen.
 */

public class GameView {
  
  private GameGrid grid;
  private HighScoreController highScoreController;
  public static final int DEFAULT_NODE_SIZE = 15;
  PFont font;
  
  // Constructor for GameView
  public GameView(GameGrid grid, HighScoreController highScoreController) {
    this.grid = grid;
    this.highScoreController = highScoreController;
    font = createFont("Arial", 16, true);
  }
  
  /*
   * Draws the main menu screen
   */
  public void drawStart() {
    textAlign(CENTER);
    background(125);
    fill(255);
    textFont(font, 32);
    text("SNAKE", width/2, 60);
    
    textFont(font, 12);
    text("Press p to play", width/2, 400);
    text("Press h to view high scores", width/2, 420);
    text("UP, DOWN, LEFT, RIGHT on keyboard move the snake", width/2, 440);
  }
  
  /*
   * Draws the high scores screen
   */
  public void drawHighScores() {
    textAlign(CENTER);
    background(125);
    fill(255);
    textFont(font, 16);
    text("HIGH SCORES", width/2, 20);
    textFont(font, 12);
    text(highScoreController.getHighScoreString(), width/2, 40);
    text("Press r to return to main menu", width/2, 400);
  }
  
  /*
   * Draw the game screen
   */
  public void draw() {
    drawGameGrid();
    drawSnake(grid.getSnake());
    drawApple(grid.getApple());
    drawBottomPanel();
  }
  
  /*
   * Draws the snake
   */
  public void drawSnake(Snake snake) {
    fill(0, 255, 0);
    for (Node node : snake.getBody()) {
      // Draw each node in snake's body as a rect
      // Multiply node's x and y position on game grid by node size to translate game grid coordinates to screen coordinates
      rect(node.getX() * DEFAULT_NODE_SIZE, node.getY() * DEFAULT_NODE_SIZE, DEFAULT_NODE_SIZE, DEFAULT_NODE_SIZE);
    }
  }
  
  /*
   * Draws an apple
   */
  public void drawApple(Node apple) {
    fill(255, 0, 0);
    // Multiply node's x and y position on game grid by node size to translate game grid coordinates to screen coordinates
    rect(apple.getX() * DEFAULT_NODE_SIZE, apple.getY() * DEFAULT_NODE_SIZE, DEFAULT_NODE_SIZE, DEFAULT_NODE_SIZE);
  }
  
  /*
   * Draw the grid onscreen so the player can easily tell what node(s) the snake and apples occupy on the game grid
   */
  public void drawGameGrid() {
    for (int i = 0; i < grid.getWidth(); i++) {
      line(i * DEFAULT_NODE_SIZE, 0, i * DEFAULT_NODE_SIZE, height);
    }
    for (int i = 0; i < grid.getHeight(); i++) {
      line (0, i * DEFAULT_NODE_SIZE, width, i * DEFAULT_NODE_SIZE);
    }
  }
  
  /*
   * Draw a panel at the bottom of the screen to display the player's current score
   */
  public void drawBottomPanel() {
    textAlign(LEFT);
    fill(0);
    rect(0, grid.getHeight() * DEFAULT_NODE_SIZE, width, 30);
    textFont(font, 16);
    fill(255);
    text("Score: " + grid.getScore(), 10, 470);
  }
  
  public GameGrid getGameGrid() {
    return grid;
  }
  
  public void setGameGrid(GameGrid grid) {
    this.grid = grid;
  }
  
}