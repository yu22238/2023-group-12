public class Instructions{

    private PFont mono;

    public Instructions(){
        this.mono = loadFont("Assets/font123.vlw");
    }

    public void display(){
        textFont(mono);
              textSize(20);
              fill(255, 255, 255);
              text("Aim: Collect all diamonds and get to corresponding door!  Press R to restart level", width/3, height/25);
    }


}
