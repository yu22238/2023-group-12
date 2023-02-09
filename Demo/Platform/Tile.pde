public class Tile extends GameObject {
    private PShape rect;
    private int row;
    private int col;
    public Collider coll;

    public Tile (int row, int col, String tag) {
        super(col*TILE_SIZE, row*TILE_SIZE, TILE_SIZE, TILE_SIZE, tag);
        this.row = row;
        this.col = col;
        this.coll = new Collider(this.position.x, this.position.y, TILE_SIZE, TILE_SIZE);
        setTile();
    }

    private void setTile() {
        if (this.getTag() == "Obstacle") {
            this.rect = createShape(RECT, this.position.x, this.position.y, TILE_SIZE, TILE_SIZE);
            this.rect.setFill(color(204, 102, 0));
        } else {
            this.rect = createShape(RECT, this.position.x, this.position.y, TILE_SIZE, TILE_SIZE);
            this.rect.setFill(color(0, 0, 0));
        }
    }

    public void display() {
        shape(this.rect);
    }
}
