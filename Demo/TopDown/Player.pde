public class Player extends GameObject {
    PShape rect;
    Collider coll;
    PVector velocity;
    float speed;
    InputManager input;

    int fireRate;
    int fireCnt;
    boolean readyToFire;

    public Player (float x, float y, float w, float h) {
        super(x, y, w, h);
        this.rect = createShape(RECT, x, y, w, h);
        this.coll = new Collider(x, y, w, h);
        this.velocity = new PVector(0, 0);
        this.speed = 10;
        this.input = new InputManager();

        this.fireRate = 10;
        this.fireCnt = 0;
        this.readyToFire = true;
    }

    public void movement() {
        this.velocity.x = input.getHorizontalInput() * this.speed;
        this.velocity.y = input.getVerticalInput() * this.speed;
        move();
    }

    private void move() {
        this.position.add(this.velocity);
        this.rect.translate(this.velocity.x, this.velocity.y);
        this.coll.move(this.velocity.x, this.velocity.y);

        for (Obstacle ob: obstacles.obstacles) {
            if(player.coll.collideWith(ob.coll)) {
                cancelMove();
            }
        }
    }

    private void cancelMove() {
        PVector tmpVel = new PVector(-this.velocity.x, -this.velocity.y);
        this.position.add(tmpVel);
        this.rect.translate(tmpVel.x, tmpVel.y);
        this.coll.move(tmpVel.x, tmpVel.y);
    }

    private void checkFire() {
        if (this.fireCnt >= this.fireRate) {
            this.readyToFire = true;
            this.fireCnt = 0;
        }
        if (!readyToFire) {
            this.fireCnt++;
        }
    }
  
    public void fire() {
        if (input.getFire() && readyToFire) {
            this.readyToFire = false;
            PVector bullet_vel = new PVector(mouseX - this.position.x - this.w/2, mouseY - this.position.y - this.h/2);
            bullet_vel.normalize();
            bullet_vel.setMag(20);
            Bullet bullet = new Bullet(this.position.x+this.w/2,this.position.y+this.h/2, bullet_vel);
            bullets.add_bullet(bullet);
        }
    }

    public void update() {
        movement();
        checkFire();
        fire();
    }

    public void display() {
        shape(rect);    
    }
}
