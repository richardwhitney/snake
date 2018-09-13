/*
 * Defination of a heading
 * Can be either left, right, up or down
 */

public enum Heading {
  LEFT, RIGHT, UP, DOWN;
  
  /*
   * Check to see if current heading is compatible with new heading request
   * If heading is currently left or right only a new heading of up or down will return true and vice versa
   */
  public boolean compatibleWith(Heading newHeading) {
    if (this.equals(LEFT) || this.equals(RIGHT)) {
      return UP.equals(newHeading) || DOWN.equals(newHeading);
    } else {
      return LEFT.equals(newHeading) || RIGHT.equals(newHeading);
    }
  }
}