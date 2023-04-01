public class Enemies {
    public ArrayList<Enemy> enemies;
    public Enemies () {
        this.enemies = new ArrayList<Enemy>();
    }

    public void addEnemy(Enemy enemy) { this.enemies.add(enemy); }

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
