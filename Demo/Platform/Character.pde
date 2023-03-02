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

    protected void move() {
        // move to new position based on current velocity
        // don't forget to move collider along with the character
        this.position.add(this.velocity);
        this.coll.move(this.velocity.x, this.velocity.y);
        // check if the character collider's four corner collide with any obtacle
        boolean topLeftColl = collisionCheck(this.coll.topLeft);
        boolean topRightColl = collisionCheck(this.coll.topRight);
        boolean bottomLeftColl = collisionCheck(this.coll.bottomLeft);
        boolean bottomRightColl = collisionCheck(this.coll.bottomRight);

        // character hit the platform from below
        if ((topLeftColl || topRightColl) && (!bottomLeftColl && !bottomRightColl)) {
            cancelMove();
            this.velocity.y = 1;
            return;
        }
        // character landed on platform
        if ((bottomLeftColl || bottomRightColl) && (!topLeftColl && !topRightColl)) {
            cancelMove();
            this.velocity.y = 0;
            this.gravity = 0;
            this.isOnGround = true;
            return;
        }
        // character hit obstacle from left
        if ((topLeftColl && bottomLeftColl) && (!topRightColl && !bottomRightColl)) {
            cancelXMove();
            this.velocity.x = 0;
            return;
        }
        // character hit obstacle from right
        if ((topRightColl && bottomRightColl) && (!topLeftColl && !bottomLeftColl)) {
            cancelXMove();
            this.velocity.x = 0;
            return;
        }
        if ((topLeftColl && bottomLeftColl && bottomRightColl) || (topRightColl && bottomRightColl && bottomLeftColl)) {
            cancelMove();
            this.velocity.y = 0;
            this.gravity = 0;
            this.isOnGround = true;
            return;
        } 

        // if no collision, then character is in air
        this.isOnGround = false;
        this.gravity = 1;
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
