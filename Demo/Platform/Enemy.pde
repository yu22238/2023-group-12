// TODO

public class Enemy extends GameObject {
    PShape rect;
    Collider coll;

    public Enemy (float x, float y, float w, float h) {
        super(x, y, w, h, "Enemy");
        this.rect = createShape(RECT, x, y, w, h);
        this.rect.setFill(color(255, 51, 51));
        this.coll = new Collider(x, y, w, h);
    }

    public boolean isHit() {
        for (Bullet bullet: bullets.bullets) {
            if (this.coll.collideWith(bullet.coll)) {
                return true;
            }
        }
        return false;
    }

    public void isDead() {
        if (isHit()) {
            this.rect.setVisible(false);
        }
    }

    public void update() {
        isDead();
    }

    public void display() {
        shape(this.rect);
    }
}
