float TILE_SIZE = 64;
float BULLET_SIZE = 20;

Player player;
Enemies enemies;
Bullets bullets;
Obstacles obstacles;
Map map;

void setup() {
    size(1600, 896);
    player = new Player(width/2, height/2 + 200, 60, 60);
    enemies = new Enemies();
    bullets = new Bullets();
    obstacles = new Obstacles();
    map = new Map();
}

void draw() {
    background(51);
    player.update();
    player.display();
    bullets.update();
    bullets.display();
    obstacles.display();
    enemies.update();
    enemies.display();
}
