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

    public void deleteOffScreen() {
        // this.bullets.removeIf(bullet -> bullet.position.x > width || bullet.position.x < 0 || bullet.position.y < 0 || bullet.position.y > height);
        for (int i=this.bullets.size()-1; i>=0; i--) {
            Bullet bullet = this.bullets.get(i);
            if (bullet.position.x > width || bullet.position.x < 0 || 
                bullet.position.y < 0 || bullet.position.y > height) {
                    this.bullets.remove(bullet);
                }
        }
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
        deleteOffScreen();
    }
}