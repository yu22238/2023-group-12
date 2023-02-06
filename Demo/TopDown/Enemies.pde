public class Enemies {
    public ArrayList<Enemy> enemies;
    public Enemies () {
        this.enemies = new ArrayList<Enemy>();
        this.enemies.add(new Enemy(200, 200, 60, 60));
        // this.enemies.add(new Enemy(800, 750, 60, 60));
        this.enemies.add(new Enemy(900, 350, 60, 60));
    }

    public void update() {
        for (Enemy enemy: this.enemies) {
            enemy.update();
        }
    }

    public void display() {
        for (Enemy enemy: this.enemies) {
            enemy.display();
        }
    }
}
