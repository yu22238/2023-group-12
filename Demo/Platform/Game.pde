class Game implements Runnable {
    private final int UPS_SET = 120; 
    private Thread gameThread;
    
    public boolean gameStart = false;
    
    public Player fireboy;
    public Player watergirl;
    public Enemies enemies = new Enemies();
    private Enemy enemy;
    public Bullets bullets = new Bullets();
    public TileMap tileMap;
    public Diamonds diamonds;
    public DestinationGate fireGate;
    public DestinationGate waterGate;
    private River river;
    public Rivers rivers = new Rivers();
    private Button button;
    private Blocker blocker;
    public Mechanism mechanism = new Mechanism();
    
    public StartScreen startScreen = new StartScreen();
    
    public int stage = 1;
    
    public Game() {
        initClasses();
        gameThread = new Thread(this);
        gameThread.start();
    }
    
    private void initClasses() { 
        tileMap = new TileMap(3);
        fireboy = new Fireboy(tileMap.playerData.get(0),tileMap.playerData.get(1), 60, 60, inputManagerFire);
        watergirl = new Watergirl(tileMap.playerData.get(2), tileMap.playerData.get(3), 60, 60, inputManagerWater);
        fireGate = new DestinationGate(tileMap.doorData.get(0),tileMap.doorData.get(1),"Fire");
        waterGate = new DestinationGate(tileMap.doorData.get(2),tileMap.doorData.get(3),"Water");
        setEnemies();
        setDiamonds();
        setRivers();
        setMechanism();
    }
    
    private void setEnemies() {
        ArrayList<Float> enemyData = tileMap.enemyData;
        for (int i = 0;i < enemyData.size();i += 5) {
            int enemyNum;
            enemyNum = enemyData.get(i).intValue();
            switch(enemyNum) {
                case 1 : 
                    enemy = new Pirate(enemyData.get(i + 1),enemyData.get(i + 2),60,60);
                    enemy.setPatrolArea(enemyData.get(i + 1) + enemyData.get(i + 3), enemyData.get(i + 1) + enemyData.get(i + 4));
                    break;
                
                case 2 : 
                    enemy = new Cucumber(enemyData.get(i + 1),enemyData.get(i + 2),60,60);
                    enemy.setPatrolArea(enemyData.get(i + 1) + enemyData.get(i + 3), enemyData.get(i + 1) + enemyData.get(i + 4));
                    break;
                
                case 3 : 
                    enemy = new BigGuy(enemyData.get(i + 1),enemyData.get(i + 2),60,60);
                    enemy.setPatrolArea(enemyData.get(i + 1) + enemyData.get(i + 3), enemyData.get(i + 1) + enemyData.get(i + 4));
                    break;
                
                case 4 : 
                    enemy = new Captain(enemyData.get(i + 1),enemyData.get(i + 2),60,60);
                    enemy.setPatrolArea(enemyData.get(i + 1) + enemyData.get(i + 3), enemyData.get(i + 1) + enemyData.get(i + 4));
                    break;
                
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
    
    private void setRivers() {
        ArrayList<Float> riverData = tileMap.riverData;
        for (int i = 0;i < riverData.size();i += 3) {
            int riverNum;
            riverNum = riverData.get(i).intValue();
            String riverType;
            if (riverNum ==  1) {
                riverType = "FireRiver";
            } else if (riverNum ==  2) {
                riverType = "WaterRiver";
            } else{
                riverType = "PoisonRiver";
            }
            river = new River(riverData.get(i + 1),riverData.get(i + 2),riverType);
            rivers.riverListAdd(river);
        }
    }
    
    private void setMechanism() {
        ArrayList<Float> mechanismData = tileMap.mechanismData;
        for (int i = 0;i < mechanismData.size();i += 6) {
            button = new Button(mechanismData.get(i),mechanismData.get(i+1));
            blocker = new Blocker(mechanismData.get(i + 2),mechanismData.get(i + 3),mechanismData.get(i + 4),mechanismData.get(i + 5));
            mechanism.buttonListAdd(button);
            mechanism.blockerListAdd(blocker);
        }
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
            mechanism.update();
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
            rivers.display();
            mechanism.display();
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
