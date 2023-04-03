class Game implements Runnable {
    private final int UPS_SET = 120; 
    private Thread gameThread;
    
    public boolean gameStart = false;
    
    public Player fireboy;
    public Player watergirl;
    public Enemies enemies;
    public Enemy enemy;
    public Bullets bullets;
    public TileMap tileMap;
    public Diamonds diamonds;
    public DestinationGate fireGate;
    public DestinationGate waterGate;
    
    public StartScreen startScreen = new StartScreen();
    
    public int stage = 1;
    
    public Game() {
        initClasses();
        gameThread = new Thread(this);
        gameThread.start();
    }
    
    private void initClasses() {
        tileMap = new TileMap(1);
        fireboy = new Fireboy(tileMap.playerData.get(0),tileMap.playerData.get(1), 60, 60, inputManagerFire);
        watergirl = new Watergirl(tileMap.playerData.get(2), tileMap.playerData.get(3), 60, 60, inputManagerWater);
        bullets = new Bullets();
        enemies = new Enemies();
        fireGate=new DestinationGate(tileMap.doorData.get(0),tileMap.doorData.get(1),"Fire");
        waterGate=new DestinationGate(tileMap.doorData.get(2),tileMap.doorData.get(3),"Water");
        setEnemies();
        setDiamonds();
    }
    
    private void setEnemies() {
        ArrayList<Float> enemyData = tileMap.enemyData;
        for (int i = 0;i < enemyData.size();i += 5) {
            int enemyNum;
            enemyNum = enemyData.get(i).intValue();
            switch(enemyNum) {
                case 1:{
                    enemy = new Pirate(enemyData.get(i + 1),enemyData.get(i + 2),60,60);
                    enemy.setPatrolArea(enemyData.get(i + 1) + enemyData.get(i + 3), enemyData.get(i + 1) + enemyData.get(i + 4));
                    break;
                }
                case 2:{
                    enemy = new Cucumber(enemyData.get(i + 1),enemyData.get(i + 2),60,60);
                    enemy.setPatrolArea(enemyData.get(i + 1) + enemyData.get(i + 3), enemyData.get(i + 1) + enemyData.get(i + 4));
                    break;
                }
                case 3:{
                    enemy = new BigGuy(enemyData.get(i + 1),enemyData.get(i + 2),60,60);
                    enemy.setPatrolArea(enemyData.get(i + 1) + enemyData.get(i + 3), enemyData.get(i + 1) + enemyData.get(i + 4));
                    break;
                }
                case 4:{
                    enemy = new Captain(enemyData.get(i + 1),enemyData.get(i + 2),60,60);
                    enemy.setPatrolArea(enemyData.get(i + 1) + enemyData.get(i + 3), enemyData.get(i + 1) + enemyData.get(i + 4));
                    break;
                }
            }
            enemies.addEnemy(enemy);
        }
    }
    
    private void setDiamonds() {
        diamonds = new Diamonds();
        diamonds.diamondListAdd(new Diamond(tileMap.diamondData.get(0),tileMap.diamondData.get(1)));
        diamonds.diamondListAdd(new Diamond(tileMap.diamondData.get(2),tileMap.diamondData.get(3)));
        diamonds.diamondListAdd(new Diamond(tileMap.diamondData.get(4),tileMap.diamondData.get(5)));
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
            fireGate.update();
            waterGate.update();
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
            fireGate.display();
            waterGate.display();
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
