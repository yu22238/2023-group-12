import java.util.concurrent.*;

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

    public void deleteInvalidBullets() {
        this.bullets.removeIf(bullet -> bullet.isOffScreen() || bullet.collideWithObstacle());
    }
    
    public void update() {
        deleteInvalidBullets();
        
        CopyOnWriteArrayList<Bullet> copiedBullets = new CopyOnWriteArrayList<>(this.bullets);
        Iterator<Bullet> iterator = copiedBullets.iterator();
        while (iterator.hasNext()) {
            Bullet bullet = iterator.next();
            bullet.update();
        }
    }
    
    public void display() {
        CopyOnWriteArrayList<Bullet> copiedBullets = new CopyOnWriteArrayList<>(this.bullets);
        Iterator<Bullet> iterator = copiedBullets.iterator();
        while (iterator.hasNext()) {
            Bullet bullet = iterator.next();
            bullet.display();
        }
    }
}
