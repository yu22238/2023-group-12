float TILE_SIZE = 64;
float BULLET_SIZE = 20;

Player player;
Enemies enemies;
Bullets bullets;
TileMap tileMap;

Game game;

void setup() {
    size(1600, 896);
    game = new Game();
}

void draw() {
    background(51);
    // game.display();
    tileMap.display();
    player.display();
    bullets.display();
    enemies.display();
}
