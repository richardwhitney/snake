/*
 * Represents the area the game is played on as a grid
 */
 
import java.util.Random;

public class GameGrid {
  
  // The width of the grid
  private final int width;
  // The height of the grid
  private final int height;
  // The current score 
  private int score = 0;
  // Two dimensional array to store inaccessible positions on the grid e.g. a part of the snake
  private boolean isInaccessible[][];
  
  // Variable to hold the snake
  private Snake snake;
  // Varibale to hold the apple
  private Node apple;
  
  // The direction the snake is heading. Initialised to be heading left
  private Heading snakeHeading = Heading.LEFT;
  // Boolean to store if snake's heading has changed, used so that snake can only change heading once each move
  public boolean headingChanged = false;
  
  public GameGrid(int width, int height) {
    this.width = width;
    this.height = height;
    // Initialise boolean array to be the same size as the game grid
    isInaccessible = new boolean[width][height];
    for (int i = 0; i < this.width; i++) {
      for (int j = 0; j < this.height; j++) {
        isInaccessible[i][j] = false;
      }
    }
    
    // Add snake and initial apple to game grid
    createSnake();
    createApple();
  }
  
  /*
   * Create snake for game. Initial snake had three Nodes.
   * Update boolean array with snake's node positions.
   */
  private void createSnake() {
    // Init snake
    snake = new Snake();
    // X position of snake Node to add
    int snakeX;
    // Add three Nodes to snake's linked list and update boolean array
    for (int i = 0; i < 3; i++) {
      // Snake's head position initialised to centre of game grid. Each subsequent node on snakes body initialised one grid position to the right.
      snakeX = i + (width/2);
      snake.addTail(new Node(snakeX, height/2));
      // Update boolean array
      isInaccessible[snakeX][height/2] = true;
    }
  }
  
  /*
   * Creates an apple and positions it randomly on the game grid.
   * Checks to see if grid position is available for apple to be placed
   */
  private void createApple() {
    // x and y positions of apple to be placed on game grid
    int appleX;
    int appleY;
    
    do {
      appleX = new Random().nextInt(width);
      appleY = new Random().nextInt(height);
    } while (isInaccessible[appleX][appleY]);
    apple = new Node(appleX, appleY);
  }
   
   /*
    *
    */
   public boolean canContinue() {
     // Check to see if move of snake is valid
     if (isValidMove(snakeHeading)) {
       // Move snake a get last node on snake's body
       Node tailNode = snake.move(snakeHeading);
       // Check it snake head hit an apple
       if (snake.hitApple(apple)) {
         // Add new tail node to snake and create new apple
         snake.addTail(tailNode);
         createApple();
         // Increment score
         score++;
       }
       // Tail node has been removed from snakes body so notify boolean array that this position is now free
       else {
         isInaccessible[tailNode.getX()][tailNode.getY()] = false;
       }
       return true;
     }
     // This was an invalid move so game cannot continue
     return false;
   }
   
   /*
    * Check to see if snake's head position after current direction is added is valid
    * Return false if snakes's head collides with its body or edge of game grid
    * Return true otherwise
    */
   private boolean isValidMove(Heading heading) {
     // Get current x and y position of snake's head
     int headX = snake.getHead().getX();
     int headY = snake.getHead().getY();
     // Update snake's head position based on direction
     switch (heading) {
       case UP:
         headY--;
         break;
       case DOWN:
         headY++;
         break;
       case LEFT:
         headX--;
         break;
       case RIGHT:
         headX++;
         break;
       default:
         println("Error: Invailid direction");
         break;
     }
     
     // Cheack if new snake head position collides with edge of game grid
     if ((headX < 0) || (headX >= width) || (headY < 0) || (headY >= height)) {
       return false;
     }
     
     // Cheack if new snake head position collides with a part of the snake's body
     if (isInaccessible[headX][headY]) {
       return false;
     }
     // Update boolean array with new snake head position
     isInaccessible[headX][headY] = true;
     return true;
   }
   
   /*
    * Determine if snake can move in new direction requested
    * e.g. if snake is moving LEFT, snake cannot move RIGHT
    */
   public void changeHeading(Heading heading) {
     // If new direction is valid, update snake's direction
     if (snakeHeading.compatibleWith(heading)) {
       snakeHeading = heading;
       headingChanged = true;
     }
   }
   
   public int getWidth() {
     return width;
   }
   
   public int getHeight() {
     return height;
   }
   
   public int getScore() {
     return score;
   }
   
   public Snake getSnake() {
     return snake;
   }
   
   public Node getApple() {
     return apple;
   }
  
}