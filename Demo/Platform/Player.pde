public class Player extends GameObject {
    private PShape rect;
    //private PImage img;
    public Collider coll;
    private PVector velocity;
    private float speed;
    // fire related property
    private int fireRate;
    private int fireCnt;
    private boolean readyToFire;
    // jump related property
    private float gravity;
    private boolean isOnGround;
    private float jumpForce;

    public Player (float x, float y, float w, float h) {
        super(x, y, w, h, "Player");
        this.rect = createShape(RECT, x, y, w, h);
        // this.img = loadImage("filename");
        // this.img.resize(int(w), int(h));
        this.coll = new Collider(x, y, w, h);
        this.velocity = new PVector(0, 0);
        this.speed = 10;
        // fire related property
        this.fireRate = 10;
        this.fireCnt = 0;
        this.readyToFire = true;
        // jump related property
        this.gravity = 1;
        this.isOnGround = false;
        this.jumpForce = 20;
    }

    public void movement() {
        this.velocity.y += this.gravity;
        if (keyPressed) {
            if (key == 'a' || key == 'A') {
                this.velocity.x = -this.speed;
            }
            if (key == 'd' || key == 'D') {
                this.velocity.x = this.speed;
            }
            if (key == 'w' || key == 'W') {
                jump();
            }
        } else {
            this.velocity.x = 0;
        }
        move();
    }

    private void jump() {
        if (this.isOnGround) {
            this.velocity.y = -jumpForce;
            this.gravity = 1;
            this.isOnGround = false;
        }
    }

    private void move() {
        this.position.add(this.velocity);
        this.rect.translate(this.velocity.x, this.velocity.y);
        this.coll.move(this.velocity.x, this.velocity.y);
        // collilsion dectection 
        for (Obstacle ob: obstacles.obstacles) {
            if(this.coll.collideWith(ob.coll)) {
                // if collided with platform, then turn off gravity
                // and set vertical velocity to zero
                if (ob.getTag() == "Platform") {
                    cancelMove();
                    this.velocity.y = 0;
                    this.gravity = 0;
                    this.isOnGround = true;
                    return;
                // otherwise only set horizontal velocity to zero
                } else {
                    cancelMove();
                    this.velocity.x = 0;
                    return;
                }
            }
        }
        this.isOnGround = false;
        this.gravity = 1;
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
        if (mousePressed && readyToFire) {
            this.readyToFire = false;
            PVector bulletVel = new PVector(mouseX - this.position.x - this.w/2, mouseY - this.position.y - this.h/2);
            bulletVel.normalize();
            bulletVel.setMag(20);
            Bullet bullet = new Bullet(this.position.x+this.w/2,this.position.y+this.h/2, bulletVel);
            bullets.addBullet(bullet);
        }
    }

    public void update() {
        movement();
        checkFire();
        fire();
    }

    public void display() {
        shape(this.rect);  
        // image(this.img, this.position.x, this.position.y);  
    }
}
