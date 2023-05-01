public class EndScreen {
    private PImage endScreen;
    private PFont mono;

    public EndScreen () {
        this.endScreen = loadImage("Assets/lava.png");
        this.mono = loadFont("Assets/font123.vlw");
    }

    public void display() {
      image(endScreen, 0, 0, 1600, 896);

      // Draw title
      textAlign(CENTER);
      textFont(mono);
      textSize(50);
      fill(252, 255, 0); // Yellow color
      text("CONGRATULATIONS!", width/2, height/4);
      text("YOU HAVE ESCAPED THE TEMPLE", width/2, 80+height/4);


      
      //Back to normal for other graphics
      noFill();
      rectMode(CORNER);
      
      // Draw instructions text
      textAlign(CENTER, CENTER);
      textSize(35);
      fill(0);
      text("PRESS R TO RESTART:", width/2, height/2 - 40);

    gameRestart();
    }


    public void gameRestart(){

        if(keyPressed && (key == 'R' || key == 'r')){
            levelManager.mode=0;
            level = 1;
        }
    }


 
}
