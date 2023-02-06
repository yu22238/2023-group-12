public class Obstacle extends GameObject {
    private PShape rect;
    public Collider coll;

    public Obstacle (float x, float y, String tag) {
        super(x, y, TILE_SIZE, TILE_SIZE, tag);
        this.rect = createShape(RECT, x, y, TILE_SIZE, TILE_SIZE);
        this.rect.setFill(color(204, 102, 0));
        this.coll = new Collider(x, y, TILE_SIZE, TILE_SIZE);
    }

    public void display() {
        shape(this.rect);
    }
}
