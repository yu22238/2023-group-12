public class Bullet extends GameObject{
    private PShape circle;
    private float speed;
    public Collider coll;

    public Bullet(float x, float y, PVector vel) {
        super(x, y, BULLET_SIZE, BULLET_SIZE, "Bullet");
        this.velocity = vel;
        this.circle = createShape(ELLIPSE, this.position.x, this.position.y, this.w, this.h);
        this.circle.setFill(color(255, 255, 0));
        this.coll = new Collider(x-this.w/2, y-this.h/2, this.w, this.h);
    }

    public boolean collideWithObstacle() {
        // get position of the tile which we need to check collision
        int row = int(this.position.y / TILE_SIZE);
        int col = int(this.position.x / TILE_SIZE);
        if (row < 0 || row >= game.tileMap.getTileMap().length || col < 0 || col >= game.tileMap.getTileMap()[0].length) { return false; };
        Tile tile = game.tileMap.getTileMap()[row][col];

        if (this.coll.collideWith(tile.coll)) {
            if (tile.getTag() == "Obstacle") { return true; } 
        }
        return false;
    }

    public boolean isOffScreen() {
        return this.position.x > width || this.position.x < 0 || this.position.y < 0 || this.position.y > height;
    }
  
    public void move() {
        this.position.add(this.velocity);
        this.circle.translate(this.velocity.x, this.velocity.y);
        this.coll.move(this.velocity.x, this.velocity.y);
    }
    
    public void update() {
        move();
    }
    
    public void display() {
        shape(this.circle);
    }
}
