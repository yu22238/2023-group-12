// TODO

public class Enemy extends Character {
    // PShape rect;
    private float patrolLeftBoundary;
    private float patrolRightBoundary;
    private float speed;

    public Enemy (float x, float y, float w, float h) {
        super(x, y, w, h, "Enemy");
        this.health = 5;
        setImage(loadImage("Assets/Enemy1/1.png"));
        this.image.resize((int)w, (int)h);
        this.coll = new Collider(x, y, w, h);

        this.speed = 1;
        this.velocity = new PVector(this.speed, 0);

        this.stateMachine = new StateMachine(this);
        this.animator = new Animator(this, "Assets/Enemy1");
        this.animator.setAnimation(State.IDLE_L, "Idle_L", 34, int(w), int(h), true);
        this.animator.setAnimation(State.IDLE_R, "Idle_R", 34, int(w), int(h), true);
        this.animator.setAnimation(State.WALK_L, "Run_L", 14, int(w), int(h), true);
        this.animator.setAnimation(State.WALK_R, "Run_R", 14, int(w), int(h), true);
        this.animator.setAnimation(State.DEAD_L, "Dead_L", 12, int(w), int(h), false);
        this.animator.setAnimation(State.DEAD_R, "Dead_R", 12, int(w), int(h), false);
    }

    public void setPatrolArea(float left, float right) {
        this.patrolLeftBoundary = left;
        this.patrolRightBoundary = right;
    }

    private void patrolUpdate() {
        if (this.position.x <= this.patrolLeftBoundary) {
            this.velocity.x = this.speed;
        }
        if (this.position.x >= this.patrolRightBoundary) {
            this.velocity.x = -this.speed;
        }
    }

    protected void movement() {
        this.velocity.y += this.gravity;
        if (isDead()) { return; }
        move();
        updateFacing();
    }

    public boolean isHit() {
        for (Bullet bullet: bullets.bullets) {
            if (this.coll.collideWith(bullet.coll)) {
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
        patrolUpdate();
        movement();
        isHit();
        isDead();
        stateMachine.updateState();
        // animator.playAnimation();
    }
}
