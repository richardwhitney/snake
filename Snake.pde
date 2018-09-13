/* 
 * The snake that the player controlls
 * The snake is made up of individual nodes in a linked list
 * The first node of the list is referred to as the snake's head
 */

import java.util.LinkedList;

public class Snake {
  
  // Collection to store each node of the snake
  private LinkedList<Node> body = new LinkedList<Node>();
  
  /* 
   * Moves the snake depending on its heading.
   * Adds a node to the begining of the snake and removes one at the end to simulate movement
   */
  public Node move(Heading heading) {
    // New node for the snake's head
    Node node;
    // The x position of the snake's head
    int x = body.getFirst().getX();
    // The y position of the snake's head
    int y = body.getFirst().getY();
    // Determine the new position of the snake's head
    switch(heading) {
      case UP:
        node = new Node(x, y - 1);
        break;
      case DOWN:
        node = new Node(x, y + 1);
        break;
      case LEFT:
        node = new Node(x - 1, y);
        break;
      case RIGHT:
        node = new Node(x + 1, y);
        break;
      default:
        node = null;
        break;
    }
    // Add new node to snake
    body.addFirst(node);
    /* 
     * Remove last node from snake's body and return it
     * Return this node so that we can notify the game grid that this postion no longer contains a snake node and
     * we can add a node to the tail of the snake if it hits an apple
     */
    return body.removeLast();
  }
  
  /*
   * Check if snake's head collided with an apple
   * 
   */
  public boolean hitApple(Node apple) {
    Node head = body.getFirst();
    if ((head.getX() == apple.getX()) && (head.getY() == apple.getY())) {
      return true;
    } else {
      return false;
    }
  }
  
  public Node getHead() {
    return body.getFirst();
  }
  
  public Node addTail(Node tail) {
    body.addLast(tail);
    return tail;
  }
  
  public LinkedList<Node> getBody() {
    return body;
  }
  
}