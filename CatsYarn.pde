// Name: Tamara Alilovic
// Date: January 18th, 2019
// Title: Cat's Yarn
// Project Description: The user moves the jumping cat left and right across the screen to collect the yarn. If the cat comes in contact
//                      with a mouse, the game ends and the user must restart. A score system keeps count of how many balls of yarn the
//                      user has collected, and the user's highest score is saved.

// GLOBAL VARIABLES/OBJECTS:
// Fonts: create objects for fonts from PFont class
PFont titleFont; // font for titles/subtitles in pop-up windows
PFont descFont; // standard font for descriptions/minor text in pop-up windows
PFont startFont; // font for start button at the beginning of the game
boolean startButtonPressed = false; // variable for keeping track of if the user pressed the start button
boolean restartButtonPressed = false; // variable for keeping track of if the user pressed the restart button
boolean gameOver = false; // variable for keeping track of if the user touched the mouse
Cat cat; // create an object reference variable named cat for the Cat class
Yarn1 yarn; // create an object reference variable named yarn for the Yarn class
Yarn2 yarn2; // create an object reference variable named yarn2 for the Yarn2 class
Cat2 cat2;
Mouse mouse; // create an object reference variable named mouse for the Mouse class
int score = 0; // variable for keeping count of how many balls of yarn the user collected
int highScore = 0; // variable for saving user's highest score

void setup()
{
  // Set the size of the window of the sketch to be 400 by 600 pixels:
  size(400, 600);
  // Create new Cat object
  cat = new Cat();
  // Create new Yarn object
  yarn = new Yarn1();
  yarn2 = new Yarn2();
  // Create new Mouse object
  mouse = new Mouse();
  cat2 = new Cat2();
}

void draw()
{
  // BACKGROUND
  background(#AAD5FF); // sky
  rectMode(CORNER); // set rectangle mode to corner
  fill(#6CBF70); // set the colour of the grass
  noStroke();  // specify that there is no outline on the grass
  rect(0, 500, 400, 600); // grass
  
  // Display starting window with messages
  startGameDisplay(startButtonPressed);
  // If the user presses the "START" or the "RESTART" button...
  if(mouseX > 160 && mouseX < 240 && mouseY > 350 && mouseY < 400 && mousePressed)
  {
    // Set the "startButtonPressed" variable to true
    startButtonPressed = true;
  }
  
  // If the "START" or "RESTART" button was pressed...
  if (startButtonPressed)
  {
    // Display the background again so that the window disappears
    background(#AAD5FF); // sky
    rectMode(CORNER); // set rectangle mode to corner
    fill(#6CBF70); // set colour of grass
    noStroke();  // specify that there is no outline for the grass
    rect(0, 500, 400, 600); // grass
    
    //cat2.display();
    
    // Call the display and jump methods for cat to have the cat displayed on the screen and jumping
    cat.display();
    cat.jump();
    
    // Get the values of the x and y positions of the objects and save them to float variables
    float catYPos = cat.sendYPos();
    float mouseXPos = mouse.sendXPos();
    float mouseYPos = mouse.sendYPos();
    float yarnXPos = yarn.sendXPos();
    float yarnYPos = yarn.sendYPos();
    float yarn2YPos = yarn2.sendYPos();
    float yarn2XPos = yarn2.sendXPos();
    
    // Call the display and move methods for the first yarn class to have it displayed and sliding across the screen
    yarn.display(); 
    yarn.move();
    
    // Call the display and move methods for the second yarn class to have it displayed and sliding across the screen
    yarn2.display();
    yarn2.move();
    
    // Call the display and move methods for the mouse class to have it displayed and sliding across the screen
    mouse.display();
    mouse.move();
    
    // BOUNDARY IF STATEMENTS:
    // If statements that sense if the cat comes in contact with a mouse or a ball of yarn.
    // If the cat comes in contact with a ball of yarn from the Yarn class...
    if(catYPos >= yarnYPos - 16 && catYPos <= yarnYPos + 16 && mouseX >= yarnXPos - 16 && mouseX <= yarnXPos + 16)
    {
      score++; // increment the score variable by 1
      yarn.reset(); // reset the x and y position of the ball of yarn so that it disappears and a new one reappears from the
                    // left side of the screen
    }
    
    // If the cat comes in contact with a ball of yarn from the Yarn2 class...
    if(catYPos >= yarn2YPos - 16 && catYPos <= yarn2YPos + 16 && mouseX >= yarn2XPos - 16 && mouseX <= yarn2XPos + 16)
    {
      score++; // increment the score variable by 1
      yarn2.reset(); // reset the x and y position of the ball of yarn so that it disappears and a new one reappears from the
                     // left side of the screen
    }
    
    // If the mouse slides off of the screen...
    if(mouseXPos < -40)
    { // reset the mouse's position to its initial position so that it can come back
      mouse.reset();
    }
    
    // If the ball of yarn slides off the screen...
    if(yarnXPos > 430)
    { // reset the yarn's position to its initial position so that it can come back
      yarn.reset();
    }
    
    // If the ball of yarn slides off the screen...
    if(yarn2XPos > 430)
    { // reset the yarn's position to its initial position so that it can come back
      yarn2.reset();
    }
    
    // If the cat comes in contact with a mouse...
    if(catYPos >= mouseYPos - 9 && catYPos<= mouseYPos + 9 && mouseX >= mouseXPos - 20 && mouseX<= mouseXPos + 20)
    {
      // Call the gameOver method for all of the objects so that they disappear off of the screen
      mouse.gameOver();
      yarn.gameOver();
      yarn2.gameOver();
      cat.gameOver();
      // set the gameOver variable to true
      gameOver = true;
    }
    
    // If the user's new score is higher than the current high score...
    if (score > highScore)
    {
      // Set that score to be the new high score
      highScore = score;
    }
  }
  
  // If the "gameOver" variable is true...
  if (gameOver)
    {
      // Display the "Game Over" box
      gameOverDisplay(restartButtonPressed, gameOver);
      // If the user presses the "RESTART" button...
      if(mouseX > 160 && mouseX < 240 && mouseY > 350 && mouseY < 400 && mousePressed)
      {
        // Set the "gameOver" variable to false
        gameOver = false;
      }
    }
}

// "START GAME" BOX:
boolean startGameDisplay(boolean startButtonPressed)
{
  // Draw yellow box:
  rectMode(CORNER); // set rectangle mode to corner
  fill(#EAD56B); // set colour of box
  strokeWeight(2); // set thickness of outline of box
  stroke(#DBB404); // set the colour of the outline of the box
  rect(75, 100, 250, 350); // draw the box
  
  // Write game title in yellow box:
  // Create a string variable with the title of the game
  String title = "Cat's Yarn";
  // Load the font for the title and save it to titleFont variable
  titleFont  = loadFont("ForteMT-48.vlw");
  // Display title in box using font:
  textFont(titleFont); // Set the font to the loaded title font
  fill(#E55151); // colour of text
  textSize(48); // set size of title
  textAlign(CENTER, 100); // specify the justification/position of the text
  text(title, width/2, 160); // print the text
  
  // Write game description in yellow box:
  // Create a string variable with the description of the game
  String desc = "Move your cat left and right\nto " + 
                "collect as many balls\nof yarn as " +
                "you can! \nHowever, you need to" +
                "\navoid the mice, or \nyou will lose." + " \n\n Click START to begin.";
  // Load the font for the description and save it to descFont variable
  descFont = loadFont("DejaVuSans-Bold-14.vlw");
  // Display description in box using font:
  textFont(descFont); // Set the font to the loaded description font
  fill(#434343); // text colour
  textSize(14); // set size of description
  textLeading(16); // specify the spacing between the lines of text
  textAlign(CENTER, 150); // specify the justification/position of the text
  text(desc, width/2, 200); // print text
  
  // START button:
  // Draw rectangle for start button:
  fill(#E86060); // specify button colour
  strokeWeight(2); // specify thickness of outline
  stroke(#D34040); // specify colour of outline
  rectMode(CENTER); // set rectangle mode to center
  rect(width/2, 375, 80, 50);
  // Write "START" in button:
  // Create a string variable with the word "START"
  String start = "START";
  // Load the font for the START button
  startFont = loadFont("FranklinGothic-Demi-20.vlw");
  textFont(startFont); // Set the font to the loaded start font
  fill(250); // text colour
  textSize(18); // set size of text
  textAlign(CENTER, CENTER); // specify the justification/position of the text
  text(start, width/2, 375); // print text
  
  // return the startButtonPressed variable
  return(startButtonPressed);
}

// "GAME OVER" BOX:
boolean gameOverDisplay(boolean restartButtonPressed, boolean gameOver)
{
  // Draw yellow box:
  rectMode(CORNER); // set rectangle mode to corner
  fill(#EAD56B); // specify colour of the box
  strokeWeight(2); // specify the thickness of the outline of the box
  stroke(#DBB404);// specify the colour of the outline of the box
  rect(75, 100, 250, 350); // draw the box
  
  // Print "Game Over!" text in yellow box:
  // Create a string variable with the description of the game
  String gameover = "Game Over!";
  textFont(startFont); // Set the font to the loaded start font
  fill(#E86060); // set the colour of the text
  textAlign(CENTER, CENTER); // specify the justification/position of the text
  textSize(30); // specify the font size
  text(gameover, width/2, 160); // print text
  
  // Print description and points in box:
  String desc = "\nYour score is: " + score + ".\nYour highest score is: " + highScore + ". \n\nPress the RESTART\nbutton to play again.";
  textFont(descFont); // Set the font to the loaded description font
  fill(#434343); // set the colour of the text
  textSize(14); // set the text size
  textAlign(CENTER, 200); // specify the justification/position of the text
  text(desc, width/2, 200); // print test
  
  // RESTART button:
  // Draw rectangle for restart button:
  fill(#E86060); // specify button colour
  strokeWeight(2); // specify thickness of outline
  stroke(#D34040); // specify colour of outline
  rectMode(CENTER); // set rectangle mode to center
  rect(width/2, 375, 80, 50); // draw the box
  // Write "START" in button:
  // Create a string variable with the word "START"
  String start = "RESTART";
  textFont(startFont); // Set the font to the loaded start font
  fill(250); // text colour
  textSize(18); // set size of text
  textAlign(CENTER, CENTER); // specify the justification/position of the text
  text(start, width/2, 375); // print text
  
  // If the user presses the "RESTART" button...
  if(mouseX > 160 && mouseX < 240 && mouseY > 350 && mouseY < 400 && mousePressed)
  {
    // Set the "restartButtonPressed" variable to true
    restartButtonPressed = true;
    // Call the reset method for each class so that all the objects are reset to their initial positions
    cat.reset();
    mouse.reset();
    yarn.reset();
    yarn2.reset();
    // Reset the "score" variable to 0
    score = 0;
  }
  
  // Return the "restartButtonPressed" variable
  return restartButtonPressed;
}
