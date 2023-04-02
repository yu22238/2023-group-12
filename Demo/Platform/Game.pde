class Game implements Runnable {
    private final int UPS_SET = 120; 
    private Thread gameThread;
    
    public boolean gameStart = false;
    
    public Player fireboy;
    public Player watergirl;
    public Enemies enemies;
    public Bullets bullets;
    public TileMap tileMap;
    public Diamonds diamonds;
    
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
        setDiamonds();
    }
    
    private void setEnemies() {
        Enemy pirate = new Pirate(tileMap.PRIVATE_X, tileMap.PRIVATE_Y, 60, 60);
        pirate.setPatrolArea(tileMap.PRIVATE_X + tileMap.PRIVATE_LEFT, tileMap.PRIVATE_X + tileMap.PRIVATE_RIGHT);
        Enemy cucumber = new Cucumber(tileMap.CUCUMBER_X, tileMap.CUCUMBER_Y,60, 60);
        cucumber.setPatrolArea(tileMap.CUCUMBER_X + tileMap.CUCUMBER_LEFT,tileMap.CUCUMBER_X + tileMap.CUCUMBER_RIGHT);
        Enemy bigGuy = new BigGuy(tileMap.BIGGUY_X, tileMap.BIGGUY_Y, 60, 60);
        bigGuy.setPatrolArea(tileMap.BIGGUY_X + tileMap.BIGGUY_LEFT,tileMap.BIGGUY_X + tileMap.BIGGUY_RIGHT);
        Enemy captain = new Captain(tileMap.CAPTAIN_X, tileMap.CAPTAIN_Y, 60, 60);
        captain.setPatrolArea(tileMap.CAPTAIN_X + tileMap.CAPTAIN_LEFT, tileMap.CAPTAIN_X + tileMap.CAPTAIN_RIGHT);
        enemies.addEnemy(pirate);
        enemies.addEnemy(cucumber);
        enemies.addEnemy(bigGuy);
        enemies.addEnemy(captain);
    }
    
    private void setDiamonds() {
        diamonds=new Diamonds();
        diamonds.diamondListAdd(new Diamond(tileMap.DIAMOND_X_1,tileMap.DIAMOND_Y_1));
        diamonds.diamondListAdd(new Diamond(tileMap.DIAMOND_X_2,tileMap.DIAMOND_Y_2));
        diamonds.diamondListAdd(new Diamond(tileMap.DIAMOND_X_3,tileMap.DIAMOND_Y_3));
    }
    
    public void update() {
        if (this.stage == 1 && keyPressed) {
            this.stage = 2;
            this.gameStart = true;
        }
        if (this.gameStart) {
            diamonds.update();
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
            diamonds.display();
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
