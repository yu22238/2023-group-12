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
        boolean topLeftColl = collisionCheck(this.coll.topLeft, "topLeft");
        boolean topRightColl = collisionCheck(this.coll.topRight, "topRight");
        boolean bottomLeftColl = collisionCheck(this.coll.bottomLeft, "bottomLeft");
        boolean bottomRightColl = collisionCheck(this.coll.bottomRight, "bottomRight");

        if (topLeftColl || topRightColl || bottomLeftColl || bottomRightColl) {
            return;
        }
        // if no collision, then character is in air
        this.isOnGround = false;
        this.gravity = 1;
    }

    protected boolean collisionCheck(PVector cornerPos, String cornerName) {
        int row = int(cornerPos.y / TILE_SIZE);
        int col = int(cornerPos.x / TILE_SIZE);
        Tile tile = tileMap.getTileMap()[row][col];

        if (this.coll.collideWith(tile.coll)) {
            if (tile.getTag() == "Obstacle") {
                // character hit the platform from below
                if (cornerName == "topRight" || cornerName == "topLeft") {
                    cancelMove();
                    this.velocity.y = 1;
                // character landed on platform
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
    protected void cancelMove() {
        PVector tmpVel = new PVector(-this.velocity.x, -this.velocity.y);
        this.position.add(tmpVel);
        this.coll.move(tmpVel.x, tmpVel.y);
    }
}
