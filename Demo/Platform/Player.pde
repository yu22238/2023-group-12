public class Player extends Character {
    private float speed;
    // attack related property
    private int fireRate;
    private int fireCnt;
    private boolean readyToFire;
    // jump related property
    private float jumpForce;

    public Player (float x, float y, float w, float h) {
        super(x, y, w, h, "Player");
        this.coll = new Collider(x, y, w, h);
        this.velocity = new PVector(0, 0);
        this.speed = 3;
        this.health = 10;
        // fire related property
        this.fireRate = 20;
        this.fireCnt = 0;
        this.readyToFire = true;
        // jump related property
        this.jumpForce = 15;
        // set state machine and animation
        this.stateMachine = new StateMachine(this);
        this.animator = new Animator(this, "Assets/Player");
        this.animator.setAnimation(State.IDLE_L, "Idle_L", 26, int(w), int(h), true);
        this.animator.setAnimation(State.IDLE_R, "Idle_R", 26, int(w), int(h), true);
        this.animator.setAnimation(State.FALL_L, "Fall_L", 2, int(w), int(h), false);
        this.animator.setAnimation(State.FALL_R, "Fall_R", 2, int(w), int(h), false);
        this.animator.setAnimation(State.JUMP_L, "Jump_L", 5, int(w), int(h), false);
        this.animator.setAnimation(State.JUMP_R, "Jump_R", 5, int(w), int(h), false);
        this.animator.setAnimation(State.WALK_L, "Run_L", 14, int(w), int(h), true);
        this.animator.setAnimation(State.WALK_R, "Run_R", 14, int(w), int(h), true);
    }
    // handle input, set the velocity based on input,
    // then move player based on velocity
    protected void movement() {
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

    public boolean isDead() {
        return false;
    }

    public void update() {
        movement();
        checkFire();
        fire();
        stateMachine.updateState();
        // animator.playAnimation();
    }
}
