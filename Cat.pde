// Cat Class

public class Cat
{
  // List private fields:
  private PImage cat;
  private float yPos;
  private float ySpeed;
  private float increaseSpeed;
  
  // Constructor Method:
  public Cat()
  {
    yPos = 510; // set the initial y position of the cat to be on the grass
    ySpeed = 9.5; // set the speed of the cat
    cat = loadImage("restCatcropped.png"); // load the sprite of the cat
    increaseSpeed = 0.1; // set the "increaseSpeed" variable to 0.1
  }
  
  // Display the cat on the screen
  public void display()
  {
    image(cat, mouseX, yPos, 20, 34); // display the image of the cat at the yPos specified in the constructor method,
                                      // and to have it follow the user's mouse in the x-position. The last two values
                                      // specify the size of the image of the cat.
  }
  
  // Have the cat jump consistently
  public void jump()
  {
    yPos = yPos - ySpeed; // This makes the cat jump up from the ground
    ySpeed = ySpeed - increaseSpeed; // This makes the cat slow down near the top and fall back to the ground
    // When the cat comes back to the ground...
    if (yPos >= 510)
    {
      // Invert the ySpeed variable so that the cat jumps back up instead of continue off of the screen
      ySpeed = -ySpeed;
    }
  }
  
  // Send the value of the y-position
  public float sendYPos()
  { // This is for testing when the cat comes in contact with any of the other objects
    return yPos; // sends value of y-position
  }
  
  public void gameOver()
  { // When the cat comes in contact with the mouse...
    ySpeed = 0; // cat stops moving
    increaseSpeed = 0; // cat's speed stops increasing/decreasing
    yPos = -100; // cat's y-position is positioned off of the screen so that the user cannot see it
  }
  
  // Restart the game:
  public void reset()
  { // When the user presses the restart button, this method is called
    increaseSpeed = 0.1; // re-initialize the increaseSpeed variable
    ySpeed = 9.5; // re-initialize the ySpeed variable
    yPos = 510; // reset the cat's y-position
  }
}
