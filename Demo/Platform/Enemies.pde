// TODO

public class Enemies {
    public ArrayList<Enemy> enemies;
    public Enemies () {
        this.enemies = new ArrayList<Enemy>();
        Enemy enemy1 = new Enemy(200, 100, 60, 60);
        Enemy enemy2 = new Enemy(800, 200, 60, 60);
        enemy1.setPatrolArea(190, 360);
        enemy2.setPatrolArea(650, 840);
        this.enemies.add(enemy1);
        this.enemies.add(enemy2);
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
