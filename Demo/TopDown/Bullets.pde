public class Bullets {
    public ArrayList<Bullet> bullets;
    
    public Bullets() {
        this.bullets = new ArrayList<Bullet>();
    }
    
    public void addBullet(Bullet bullet) {
        this.bullets.add(bullet);
    }
    
    public void removeBullet(Bullet bullet) {
        this.bullets.remove(bullet);
    }
    
    public void update() {
        for (Bullet bullet: this.bullets) {
            bullet.update();
        }
    }
    
    public void display() {
        for (Bullet bullet: this.bullets) {
            bullet.display();
        }
    }
}