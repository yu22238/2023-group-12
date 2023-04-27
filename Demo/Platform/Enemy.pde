public class Enemy extends Character {
    protected float patrolLeftBoundary = -100;
    protected float patrolRightBoundary = -100;
    protected float speed;

    private float idleTime = 200;
    private float idleCnt = 0;

    public Enemy (float x, float y, float w, float h) {
        super(x, y, w, h, "Enemy");
        this.health = ENEMY_HEALTH;
        
        this.coll = new Collider(x, y, w, h);

        this.speed = 1;
        this.velocity = new PVector(this.speed, 0);

        this.stateMachine = new StateMachine(this);
    }

    public void setAnimator(Animator animator) { this.animator = animator; }

    public Animator getAnimator() { return this.animator; }

    public void setHealth(int health) { this.health = health; }

    public void setPatrolArea(float left, float right) {
        this.patrolLeftBoundary = left;
        this.patrolRightBoundary = right;
    }

    private void patrolUpdate() {
        if (this.patrolLeftBoundary == -100 || this.patrolRightBoundary == -100) {
            this.velocity.x = 0;
            return;
        }
        if (this.position.x == this.patrolLeftBoundary) {
            this.velocity.x = 0;
            this.idleCnt++;
            if (this.idleCnt > this.idleTime) {
                this.idleCnt = 0;
                this.velocity.x = this.speed;
            }
        } else if (this.position.x == this.patrolRightBoundary) {
            this.velocity.x = 0;
            this.idleCnt++;
            if (this.idleCnt > this.idleTime) {
                this.idleCnt = 0;
                this.velocity.x = -this.speed;
            }
        }
        if (this.position.x < this.patrolLeftBoundary) {
            this.velocity.x = this.speed;
        }
        if (this.position.x > this.patrolRightBoundary) {
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
        for (Bullet bullet: game.bullets.bullets) {
            if (this.coll.collideWith(bullet.coll)) {
                if (this.health > 0) {
                    this.health--;
                }
                game.bullets.removeBullet(bullet);
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

    private void drawHealthBar() {
        float wholeLength = 50;
        float currentLength = wholeLength * ((float)this.health / (float)ENEMY_HEALTH);
        PShape wholeBar = createShape(RECT, this.position.x, this.position.y -10, wholeLength, 5);
        PShape healthBar = createShape(RECT, this.position.x, this.position.y - 10, currentLength, 5);
        wholeBar.setFill(color(255, 255, 255));
        healthBar.setFill(color(255, 0, 0));
        shape(wholeBar);
        shape(healthBar);
    }

    public void update() {
        if (isDead()) { return; }
        patrolUpdate();
        movement();
        isHit();
        isDead();
        stateMachine.updateState();
    }

    public void display() {
        super.display();
        drawHealthBar();
    }
}
