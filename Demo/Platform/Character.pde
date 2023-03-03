public abstract class Character extends GameObject {
    public Collider coll;
    protected float gravity = 1;
    protected boolean isOnGround = false;
    protected StateMachine stateMachine;
    protected Animator animator;

    public Character (float x, float y, float w, float h, String tag) {
        super(x, y, w, h, tag);
        this.velocity = new PVector(0, 0);
    }

    protected abstract void movement();

    private void moveX() {
        this.position.add(new PVector(this.velocity.x, 0));
        this.coll.move(this.velocity.x, 0);

        boolean topLeftColl = collisionCheck(this.coll.topLeft);
        boolean topRightColl = collisionCheck(this.coll.topRight);
        boolean bottomLeftColl = collisionCheck(this.coll.bottomLeft);
        boolean bottomRightColl = collisionCheck(this.coll.bottomRight);

        if (topLeftColl || topRightColl || bottomLeftColl || bottomRightColl) {
            cancelXMove();
            return;
        }
    }

    private void moveY() {
        this.position.add(new PVector(0, this.velocity.y));
        this.coll.move(0, this.velocity.y);

        boolean topLeftColl = collisionCheck(this.coll.topLeft);
        boolean topRightColl = collisionCheck(this.coll.topRight);
        boolean bottomLeftColl = collisionCheck(this.coll.bottomLeft);
        boolean bottomRightColl = collisionCheck(this.coll.bottomRight);

        // character hit the platform from below
        if ((topLeftColl || topRightColl) && (!bottomLeftColl && !bottomRightColl)) {
            cancelYMove();
            this.velocity.y = 1;
            return;
        }
        // character landed on platform
        if ((bottomLeftColl || bottomRightColl) && (!topLeftColl && !topRightColl)) {
            cancelYMove();
            this.velocity.y = 0;
            this.gravity = 0;
            this.isOnGround = true;
            return;
        }
        // if no collision, then character is in air
        this.isOnGround = false;
        this.gravity = 1;
    }

    protected void move() {
        moveX();
        moveY();
    }

    protected boolean collisionCheck(PVector cornerPos) {
        int row = int(cornerPos.y / TILE_SIZE);
        int col = int(cornerPos.x / TILE_SIZE);
        Tile tile = tileMap.getTileMap()[row][col];

        if (this.coll.collideWith(tile.coll)) {
            if (tile.getTag() == "Obstacle") { return true; } 
        }
        return false;
    }

    // if the expected new position in next frame is blocked by an obstacle, then call this method to 
    // reset the position back to origin position
    protected void cancelMove() {
        PVector tmpVel = new PVector(-this.velocity.x, -this.velocity.y);
        this.position.add(tmpVel);
        this.coll.move(tmpVel.x, tmpVel.y);
    }

    protected void cancelXMove() {
        PVector tmpVel = new PVector(-this.velocity.x, 0);
        this.position.add(tmpVel);
        this.coll.move(tmpVel.x, tmpVel.y);
    }

    protected void cancelYMove() {
        PVector tmpVel = new PVector(0, -this.velocity.y);
        this.position.add(tmpVel);
        this.coll.move(tmpVel.x, tmpVel.y);
    }
}
