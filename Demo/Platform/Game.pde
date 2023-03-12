class Game implements Runnable {
    private final int UPS_SET = 120; 
    private Thread gameThread;

    public Game() {
        initClasses();
        gameThread = new Thread(this);
        gameThread.start();
    }

    private void initClasses() {
        player = new Player(width/2-100, height/2 + 200, 60, 60);
        enemies = new Enemies();
        bullets = new Bullets();
        tileMap = new TileMap();
    }

    public void update() {
        player.update();
        bullets.update();
        enemies.update();
    }

    public void display() {

    }
    
    public void run() {
        println("Hello from the new thread!");
        double timePerUpdate = 1000000000.0 / UPS_SET;
        long previousTime = System.nanoTime();
        int updates = 0; 
        long lastCheck = millis();
        double deltaUpdate = 0; 
        while (true) {
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
                println("UPS: " + updates);
                updates = 0;
            }
        }
    }
}
