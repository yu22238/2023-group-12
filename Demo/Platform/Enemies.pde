// TODO

public class Enemies {
    public ArrayList<Enemy> enemies;
    public Enemies () {
        this.enemies = new ArrayList<Enemy>();
        this.enemies.add(new Enemy(200, 100, 60, 60));
        this.enemies.add(new Enemy(800, 200, 60, 60));
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
