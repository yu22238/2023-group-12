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
            setImage(loadImage("Assets/Tiles/Platform.png"));
        } else {
            setImage(loadImage("Assets/Tiles/Background.png"));
        }
    }

    public void update() {}
}
