public class Player extends GameObject {
    public Collider coll;
    private float speed;
    // attack related property
    private int fireRate;
    private int fireCnt;
    private boolean readyToFire;
    // jump related property
    private float gravity;
    private boolean isOnGround;
    private float jumpForce;

    private StateMachine stateMachine;
    private Animator animator;

    public Player (float x, float y, float w, float h) {
        super(x, y, w, h, "Player");
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
        // set state machine and animation
        this.stateMachine = new StateMachine(this);
        this.animator = new Animator(this, "Assets/Player");
        this.animator.setAnimation(State.IDLE, "Idle", 26, int(w), int(h), true);
        this.animator.setAnimation(State.FALL, "Fall", 2, int(w), int(h), false);
        this.animator.setAnimation(State.JUMP, "Jump", 5, int(w), int(h), false);
        this.animator.setAnimation(State.WALK, "Run", 14, int(w), int(h), true);
    }
    // handle input, set the velocity based on input,
    // then move player based on velocity
    public void movement() {
        // the vertical velocity is constantly affected by gravity
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
        // actually move player after finishing setting up velocity
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
        // move to new position based on current velocity
        // don't forget to move collider along with the player
        this.position.add(this.velocity);
        this.coll.move(this.velocity.x, this.velocity.y);
        // check if the player collider's four corner collide with any obtacle
        boolean topLeftColl = collisionCheck(this.coll.topLeft, "topLeft");
        boolean topRightColl = collisionCheck(this.coll.topRight, "topRight");
        boolean bottomLeftColl = collisionCheck(this.coll.bottomLeft, "bottomLeft");
        boolean bottomRightColl = collisionCheck(this.coll.bottomRight, "bottomRight");

        if (topLeftColl || topRightColl || bottomLeftColl || bottomRightColl) {
            return;
        }
        // if no collision, then player is in air
        this.isOnGround = false;
        this.gravity = 1;
    }

    private boolean collisionCheck(PVector cornerPos, String cornerName) {
        int row = int(cornerPos.y / TILE_SIZE);
        int col = int(cornerPos.x / TILE_SIZE);
        Tile tile = tileMap.getTileMap()[row][col];

        if (this.coll.collideWith(tile.coll)) {
            if (tile.getTag() == "Obstacle") {
                // player hit the platform from below
                if (cornerName == "topRight" || cornerName == "topLeft") {
                    cancelMove();
                    this.velocity.y = 1;
                // player landed on platform
                } else {
                    cancelMove();
                    this.velocity.y = 0;
                    this.gravity = 0;
                    this.isOnGround = true;
                }
                return true;
            } 
        }
        return false;
    }

    // if the expected new position in next frame is blocked by an obstacle, then call this method to 
    // reset the position back to origin position
    private void cancelMove() {
        PVector tmpVel = new PVector(-this.velocity.x, -this.velocity.y);
        this.position.add(tmpVel);
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
        stateMachine.updateState();
        animator.playAnimation();
    }
}
