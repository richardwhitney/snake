/*Represents a position on the game window(grid)
  Made up of an x value and y value
  Once initiated x and y values do not change
*/
public class Node {
  
  // x position on the grid
  private int x;
  // y position on the grid
  private int y;
  
  // Constructor
  public Node(int x, int y) {
    this.x = x;
    this.y = y;
  }
  
  public int getX() {
    return x;
  }
  
  public int getY() {
    return y;
  }
  
  public void setX(int x) {
    this.x = x;
  }
  
  public void setY(int y) {
    this.y = y;
  }
  
}