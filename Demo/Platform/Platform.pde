float TILE_SIZE = 64;
float BULLET_SIZE = 20;
PImage startscreen;
PFont mono;
int stage;

Player player;
Enemies enemies;
Bullets bullets;
TileMap tileMap;

Game game;

void setup() {
    stage = 1;
    size(1600, 896);
    startscreen = loadImage("Assets/lava.png");
    image(startscreen, 0, 0, 1600, 896);
    
    game = new Game();
}

void draw() {
  if(stage==1){
    textAlign(CENTER);
    mono = loadFont("Assets/font123.vlw");
    textFont(mono);
    textSize(50);
    text("FIREBOY & WATERGIRL", 700, 300); 
    fill(252, 255, 0);
    textSize(35);
    text("Use WASD to move and click to shoot", 700, 400);
    text("Press any key to start!", 700, 500);
    if(keyPressed == true){
      stage=2;
    }
  }
  
  if(stage==2){
    
    background(51);
    // game.display();
    tileMap.display();
    player.display();
    bullets.display();
    enemies.display();
    
  }
  
}
