public class Obstacle extends GameObject {
    PShape rect;
    Collider coll;

    public Obstacle (float x, float y) {
        super(x, y, TILE_SIZE, TILE_SIZE);
        this.rect = createShape(RECT, x, y, TILE_SIZE, TILE_SIZE);
        this.rect.setFill(color(204, 102, 0));
        this.coll = new Collider(x, y, TILE_SIZE, TILE_SIZE);
    }

    public void display() {
        shape(this.rect);
    }
}
