/*
 * Let's us create an object to hold a player name and score.
 * Implement serializable so the object can be sorted.
 */
 
import java.io.Serializable;

public class PlayerScore implements Serializable {
  private String name;
  private int score;
  
  public PlayerScore(String name, int score) {
    this.name = name;
    this.score = score;
  }
  
  public String getName() {
    return name;
  }
  
  public int getScore() {
    return score;
  }
  
  /*
   * Override toString method so we can easily display a list of player scores
   * If name length is greater that 3 return first 3 letters like in the old arcades!
   */
  public String toString() {
    if (name.length() >= 3) {
      return name.substring(0,3) + ": " + score;
    }
    else {
      return name + ": " + score;
    }
  }
}