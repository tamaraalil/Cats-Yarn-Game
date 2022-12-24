// Mouse class

public class Mouse
{
  // List private fields:
  private PImage mouse;
  private float xPos;
  private float yPos;
  private float xSpeed;
  
  // Constructor Method:
  public Mouse()
  {
    mouse = loadImage("mousecropped.png"); // load the sprite of the mouse
    xPos = 425; // set the x-position to be on the left side off of the screen
    yPos = random(100, 500); // have the mouse randomly choose a y-position between 100 pixels and 500 pixels
    xSpeed = -1.5; // set the speed of the mouse (negative so that it moves to the right)
  }
  
  // Display the mouse on the screen
  public void display()
  {
    image(mouse, xPos, yPos); // display the image of the mouse at the yPos and xPos specified in the constructor method.
  }
  
  // Have the mouse scroll across the screen
  public void move()
  {
    xPos = xPos + xSpeed; // this makes the mouse move at a speed of 1.5 to the right
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
    xSpeed = 0; // mouse stops moving
    // Display the mouse off of the screen so that the user will not see it
    xPos = 1000; 
    yPos = 1000;
  }
  
  // Restart the game:
  public void reset()
  { // When the user presses the retart button, this method is called
    xPos = 425; // set mouse back to initial position
    yPos = random(100, 500); // select random y-position between 100 and 500 pixels
    xSpeed = -1.5; // set the speed of the mouse (negative so that it moves to the right)
  }
}
