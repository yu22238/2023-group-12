// TODO

public class Enemy extends Character {
    // PShape rect;

    public Enemy (float x, float y, float w, float h) {
        super(x, y, w, h, "Enemy");
        setImage(loadImage("Assets/Enemy1/1.png"));
        this.image.resize((int)w, (int)h);
        this.coll = new Collider(x, y, w, h);
    }

    protected void movement() {
        this.velocity.y += this.gravity;
        move();
    }

    public boolean isHit() {
        for (Bullet bullet: bullets.bullets) {
            if (this.coll.collideWith(bullet.coll)) {
                return true;
            }
        }
        return false;
    }

    // public void isDead() {
    //     if (isHit()) {
    //         this.rect.setVisible(false);
    //     }
    // }

    public void update() {
        movement();
        // isDead();
    }
}
