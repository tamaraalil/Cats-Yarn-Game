public class Cat2
{
  private PImage cat2;
  private float yPos;
  
  public Cat2()
  {
    yPos = 510; // set the initial y position of the cat to be on the grass
    cat2 = loadImage("foxy cat .png"); // load the sprite of the cat
  }
  
  public void display()
  {
    image(cat2, 0, 0);
  }
  
}
