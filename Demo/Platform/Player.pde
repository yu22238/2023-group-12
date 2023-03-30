public class Player extends Character {
    private float speed;
    // attack related property
    private boolean fire;
    private int fireRate;
    private int fireCnt;
    private boolean readyToFire;
    // jump related property
    private float jumpForce;

    private int safeThreshold = 20;
    private int safeCounter = 1;

    public boolean left = false;
    public boolean right = false;
    public boolean jump = false;

    protected InputManager inputManager;

    public Player (float x, float y, float w, float h) {
        super(x, y, w, h, "Player");

        this.coll = new Collider(x, y, w, h);
        this.velocity = new PVector(0, 0);
        this.speed = 3;
        this.health = PLAYER_HEALTH;
        // fire related property
        this.fire = false;
        this.fireRate = 20;
        this.fireCnt = 0;
        this.readyToFire = true;
        // jump related property
        this.jumpForce = 15;
    }

    protected void initAnimation() {
        this.animator.setAnimation(State.IDLE_L, "Idle_L", 26, int(w), int(h), true);
        this.animator.setAnimation(State.IDLE_R, "Idle_R", 26, int(w), int(h), true);
        this.animator.setAnimation(State.FALL_L, "Fall_L", 2, int(w), int(h), false);
        this.animator.setAnimation(State.FALL_R, "Fall_R", 2, int(w), int(h), false);
        this.animator.setAnimation(State.JUMP_L, "Jump_L", 5, int(w), int(h), false);
        this.animator.setAnimation(State.JUMP_R, "Jump_R", 5, int(w), int(h), false);
        this.animator.setAnimation(State.WALK_L, "Walk_L", 14, int(w), int(h), true);
        this.animator.setAnimation(State.WALK_R, "Walk_R", 14, int(w), int(h), true);
        this.animator.setAnimation(State.DEAD_L, "Dead_L", 6, int(w), int(h), false);
        this.animator.setAnimation(State.DEAD_R, "Dead_R", 6, int(w), int(h), false);
    }

    // handle input, set the velocity based on input,
    // then move player based on velocity
    protected void movement() {
        // the vertical velocity is constantly affected by gravity
        this.velocity.y += this.gravity;
        if (inputManager.getKeyList().size() > 0) {
            if (InputKey.LEFT.equals(inputManager.getLastKey())) { this.velocity.x = -this.speed; }
            if (InputKey.RIGHT.equals(inputManager.getLastKey())) { this.velocity.x = this.speed; }
            if (InputKey.JUMP.equals(inputManager.getLastKey())) { jump(); }
        } else {
            this.velocity.x = 0;
        }
        if (isDead()) { return; }
        // actually move player after finishing setting up velocity
        move();
        updateFacing();
    }

    private void jump() {
        if (this.isOnGround) {
            this.velocity.y = -jumpForce;
            this.gravity = 0.5;
            this.isOnGround = false;
        }
    }

    private void checkFire() {
        if (inputManager.getKeyList().size() > 0 && InputKey.FIRE.equals(inputManager.getLastKey())) { 
            this.fire = true; 
        } else {
            this.fire = false;
        }
        if (this.fireCnt >= this.fireRate) {
            this.readyToFire = true;
            this.fireCnt = 0;
        }
        if (!readyToFire) {
            this.fireCnt++;
        }
    }
  
    public void fire() {
        if (this.fire && readyToFire && !isDead()) {
            this.readyToFire = false;
            PVector bulletVel = new PVector(this.facing * 20, 0);
            Bullet bullet = new Bullet(this.position.x+this.w/2,this.position.y+this.h/2, bulletVel);
            game.bullets.addBullet(bullet);
        }
    }

    // check if player is hitted by an enemy
    // only reduce health when hit count surpasses threshold
    public boolean isHit() {
        if (this.safeCounter < this.safeThreshold) { 
            this.safeCounter++;
            return false; 
        } 
        for (Enemy enemy: game.enemies.enemies) {
            if (enemy.isDead()) { continue; }
            if (this.coll.collideWith(enemy.coll)) {
                this.safeCounter = 0;
                if (this.health > 0) {
                    this.health--;
                }
                return true;
            }
        }
        return false;
    }

    public boolean isDead() {
        if (this.health <= 0) {
            return true;
        }
        return false;
    }

    public void update() {
        movement();
        checkFire();
        fire();
        isHit();
        stateMachine.updateState();
    }
}
