// Yarn2 Class

public class Yarn2
{
  // List private fields:
  private PImage yarn;
  private float xPos;
  private float yPos;
  private float xSpeed;
  
  // Constructor Method:
  public Yarn2()
  {
    yarn = loadImage("lightblueballOfYarnTransparent.png"); // load the sprite of the yarn
    xPos = -30; // set the x-position to be on the left side off of the screen
    yPos = random(100, 500); // have the yarn randomly choose a y-position between 100 pixels and 500 pixels
    xSpeed = 1.9; // set the speed of the yarn
  }
  
  // set the speed of the yarn
  public void display()
  {
    image(yarn, xPos, yPos, 30, 30); // display the image of the yarn at the yPos and xPos specified in the constructor
                                     // method. The last two values specify the size of the image of the yarn.
  }
  
  // Have the yarn scroll across the screen
  public void move()
  {
    xPos = xPos + xSpeed; // this makes the yarn move at a speed of 1.7 to the left
  }
  
  // Send the value of the x-position
  public float sendXPos()
  { // This is for testing when the cat comes in contact with any of the other objects
    return xPos; // sends value of x-position
  }
  
  // Send the value of the y-position
  public float sendYPos()
  { // This is for testing when the cat comes in contact with any of the other objects
    return yPos; // sends value of y-position
  }
  
  public void gameOver()
  { // When the cat comes in contact with the mouse...
    xSpeed = 0; // set the speed to 0 so that the yarn does not move
    // Move the yarn off of the screen so that the user cannot see it
    xPos = -100;
    yPos = -100; 
  }
  
  // Restart the game:
  public void reset()
  { // When the user presses the retart button, this method is called
    xSpeed = 1.9; // set the speed to 1.9
    xPos = -30; // set yarn back to initial position
    yPos = random(100, 500); // select random y-position between 100 adn 500 pixels
  }
}
