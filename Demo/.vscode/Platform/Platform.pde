float TILE_SIZE = 64;
float BULLET_SIZE = 20;

float PLAYER_SIZE = 60;
float ENEMY_SIZE = 60;

int PLAYER_HEALTH = 10;
int ENEMY_HEALTH = 20;

Game game;

void setup() {
    size(1600, 896);
    game = new Game();
}

void draw() {
    background(51);
    game.display();
}
