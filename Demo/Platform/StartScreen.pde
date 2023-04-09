public class StartScreen {
    private PImage startscreen;
    private PFont mono;

    public StartScreen () {
        this.startscreen = loadImage("Assets/lava.png");
        this.mono = loadFont("Assets/font123.vlw");
    }

    public void display() {
      image(startscreen, 0, 0, 1600, 896);

      // Draw title
      textAlign(CENTER);
      textFont(mono);
      textSize(50);
      fill(252, 255, 0); // Yellow color
      text("FIREBOY & WATERGIRL", width/2, height/4);

      // Draw instructions box
      rectMode(CENTER);
      rect(width/2, height/2+20, 9*width/10, height/3, 20);

      // Fill in the scroll
      fill(194, 129, 62); // Darker brown color
      rect(width/2, height/2+20, 9*width/10, height/3, 20);
      
      //Back to normal for other graphics
      noFill();
      rectMode(CORNER);
      
      // Draw instructions text
      textAlign(CENTER, CENTER);
      textSize(35);
      fill(0);
      text("INSTRUCTIONS:", width/2, height/2 - 60);
      text("Watergirl: Use arrow keys to move and / to shoot", width/2, height/2 - 20);
      text("Fireboy: Use WAD to move and Q to shoot", width/2, height/2 + 40);
      text("Hint: Fireboy can walk on lava and Watergirl can swim in water!", width/2, height/2 + 100);

      text("Press any key to start!", width/2, height/2 + 240);

      nextStage();
    }

    public void nextStage(){
        if(keyPressed){
            levelManager.mode++;
        }
    }
}
