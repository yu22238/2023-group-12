public class TileMap {
    private char[][] charMap = new char[][]{
        {'#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#'},
        {'#',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ','#'},
        {'#',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ','#'},
        {'#',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ','#','#','#','#'},
        {'#',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ','#'},
        {'#',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ','#','#','#','#',' ',' ',' ',' ','#'},
        {'#',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ','#'},
        {'#',' ',' ',' ',' ',' ',' ',' ',' ',' ','#','#','#','#',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ','#'},
        {'#',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ','#'},
        {'#',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ','#','#','#','#',' ',' ',' ',' ','#'},
        {'#',' ',' ','#','#','#','#',' ','#','#',' ',' ','#','#',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ','#'},
        {'#',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ','#','#'},
        {'#','#',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ','#','#','#'},
        {'#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#'}
    };
    private Tile[][] tileMap;
    private int rowSize, colSize;

    public TileMap () {
        this.rowSize = this.charMap.length;
        this.colSize = this.charMap[0].length;
        this.tileMap = new Tile[this.rowSize][this.colSize];
        makeTileMap();
    }

    private void makeTileMap() {
        for (int i=0; i<this.rowSize; i++) {
            for (int j=0; j<this.colSize; j++) {
                if (this.charMap[i][j] == '#') {
                    this.tileMap[i][j] = new Tile(i, j, "Obstacle");
                } else {
                    this.tileMap[i][j] = new Tile(i, j, "Space");
                }
            }
        }
    }

    public Tile[][] getTileMap() {
        return this.tileMap;
    }

    public int getRowSize() {
        return this.rowSize;
    }

    public int getColSize() {
        return this.colSize;
    }

    public void display() {
        for (int i=0; i<this.rowSize; i++) {
            for (int j=0; j<this.colSize; j++) {
                this.tileMap[i][j].display();
            }
        }
    }

}
