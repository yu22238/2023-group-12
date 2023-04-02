class Game implements Runnable {
    private final int UPS_SET = 120; 
    private Thread gameThread;
    
    public boolean gameStart = false;
    
    public Player fireboy;
    public Player watergirl;
    public Enemies enemies;
    public Bullets bullets;
    public TileMap tileMap;
    
    public StartScreen startScreen = new StartScreen();
    
    public int stage = 1;
    
    public Game() {
        initClasses();
        gameThread = new Thread(this);
        gameThread.start();
    }
    
    private void initClasses() {
        tileMap = new TileMap(1);
        fireboy = new Fireboy(tileMap.FIREBOY_X,tileMap.FIREBOY_Y, 60, 60, inputManagerFire);
        watergirl = new Watergirl(tileMap.WATERGIRL_X, tileMap.WATERGIRL_Y, 60, 60, inputManagerWater);
        bullets = new Bullets();
        enemies = new Enemies();
        setEnemies();
    }
    
    private void setEnemies() {
        Enemy pirate = new Pirate(tileMap.PRIVATE_X, tileMap.PRIVATE_Y, 60, 60);
        Enemy cucumber = new Cucumber(tileMap.CUCUMBER_X, tileMap.CUCUMBER_Y,60, 60);
        Enemy bigGuy = new BigGuy(tileMap.BIGGUY_X, tileMap.BIGGUY_Y, 60, 60);
        Enemy captain = new Captain(tileMap.CAPTAIN_X, tileMap.CAPTAIN_Y, 60, 60);
        pirate.setPatrolArea(190, 360);
        cucumber.setPatrolArea(650, 840);
        captain.setPatrolArea(1050, 1200);
        enemies.addEnemy(pirate);
        enemies.addEnemy(cucumber);
        enemies.addEnemy(bigGuy);
        enemies.addEnemy(captain);
    }
    
    public void update() {
        if (this.stage == 1 && keyPressed) {
            this.stage = 2;
            this.gameStart = true;
        }
        if (this.gameStart) {
            fireboy.update();
            watergirl.update();
            bullets.update();
            enemies.update();
        }
    }
    
    public void display() {
        if (this.stage == 1) {
            startScreen.display();
        }
        if (this.stage == 2) {
            tileMap.display();
            fireboy.display();
            watergirl.display();
            bullets.display();
            enemies.display();
        }
    }
    
    public void run() {
        println("Hello from the new thread!");
        double timePerUpdate = 1000000000.0 / UPS_SET;
        long previousTime = System.nanoTime();
        int updates = 0; 
        long lastCheck = millis();
        double deltaUpdate = 0; 
        while(true) {
            long currentTime = System.nanoTime();
            deltaUpdate += (currentTime - previousTime) / timePerUpdate;
            previousTime = currentTime;
            
            if (deltaUpdate >= 1) {
                update();
                updates++;
                deltaUpdate--;
            }
            
            // UPS counting
            if (millis() - lastCheck >= 1000) {
                lastCheck = millis();
                // println("UPS: " + updates);
                updates = 0;
            }
        }
    }
}
