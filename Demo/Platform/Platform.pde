float TILE_SIZE = 64;
float BULLET_SIZE = 20;

float PLAYER_SIZE = 60;
float ENEMY_SIZE = 60;

int PLAYER_HEALTH = 10;
int ENEMY_HEALTH = 20;

int level;

LevelManager levelManager;
Game game;
StartScreen startScreen;

void setup() {
    size(1600, 896);
    level=1;
    game = new Game();
    startScreen = new StartScreen();
    levelManager = new LevelManager();
}

void draw() {
  levelManager.display();
}
