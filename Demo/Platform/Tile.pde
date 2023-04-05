public class Tile extends GameObject {
    private PShape rect;
    private int row;
    private int col;
    public Collider coll;
    
    public Tile(int row, int col, String tag) {
        super(col * TILE_SIZE, row * TILE_SIZE, TILE_SIZE, TILE_SIZE, tag);
        this.row = row;
        this.col = col;
        if (tag.equals("Fire") ||  tag.equals("Water") ||  tag.equals("Poison")) {
            this.coll = new Collider(this.position.x, this.position.y+25, TILE_SIZE, TILE_SIZE-25);
        } else{
            this.coll = new Collider(this.position.x, this.position.y, TILE_SIZE, TILE_SIZE);
        }
        
        setTile();
    }
    
    private void setTile() {
        if (this.getTag() == "Obstacle") {
            setImage(loadImage("Assets/Tiles/Platform.png"));
        } else if (this.getTag() == "Fire") {
            setImage(loadImage("Assets/Tiles/Fire.png"));
        } else if (this.getTag() == "FireLeft") {
            setImage(loadImage("Assets/Tiles/FireLeft.png"));
        } else if (this.getTag() == "FireRight") {
            setImage(loadImage("Assets/Tiles/FireRight.png"));
        } else if (this.getTag() == "Water") {
            setImage(loadImage("Assets/Tiles/Water.png"));
        } else if (this.getTag() == "WaterLeft") {
            setImage(loadImage("Assets/Tiles/WaterLeft.png"));
        } else if (this.getTag() == "WaterRight") {
            setImage(loadImage("Assets/Tiles/WaterRight.png"));
        } else if (this.getTag() == "Poison") {
            setImage(loadImage("Assets/Tiles/Poison.png"));
        } else if (this.getTag() == "PoisonLeft") {
            setImage(loadImage("Assets/Tiles/PoisonLeft.png"));
        } else if (this.getTag() == "PoisonRight") {
            setImage(loadImage("Assets/Tiles/PoisonRight.png"));
        } else if (this.getTag() == "Start") {
            setImage(loadImage("Assets/Door/Start.png"));
        } else if (this.getTag() == "Button") {
            setImage(loadImage("Assets/Tiles/Button.png"));
        } else {
            setImage(loadImage("Assets/Tiles/Background.png"));
        }
    }
    
    public void update() {}
}
