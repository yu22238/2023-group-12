float TILE_SIZE = 64;
float BULLET_SIZE = 20;

Player player;
Enemies enemies;
Bullets bullets;
TileMap tileMap;

void setup() {
    size(1600, 896);
    player = new Player(width/2-100, height/2 + 200, 60, 60);
    enemies = new Enemies();
    bullets = new Bullets();
    tileMap = new TileMap();
}

void draw() {
    background(51);
    tileMap.display();
    player.update();
    player.display();
    bullets.update();
    bullets.display();
    enemies.update();
    enemies.display();
}
