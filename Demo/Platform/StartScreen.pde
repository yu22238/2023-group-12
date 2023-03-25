public class StartScreen {
    private PImage startscreen;
    private PFont mono;

    public StartScreen () {
        this.startscreen = loadImage("Assets/lava.png");
        this.mono = loadFont("Assets/font123.vlw");
    }

    public void display() {
        image(startscreen, 0, 0, 1600, 896);
        textAlign(CENTER);
        textFont(mono);
        textSize(50);
        text("FIREBOY & WATERGIRL", 700, 300); 
        fill(252, 255, 0);
        textSize(35);
        text("Use WASD to move and click to shoot", 700, 400);
        text("Press any key to start!", 700, 500);
    }
}
