public class TileMap {
    public float FIREBOY_X;
    public float FIREBOY_Y;
    public float WATERGIRL_X;
    public float WATERGIRL_Y;
    public float PRIVATE_X;
    public float PRIVATE_Y;
    public float CUCUMBER_X;
    public float CUCUMBER_Y;
    public float BIGGUY_X;
    public float BIGGUY_Y;
    public float CAPTAIN_X;
    public float CAPTAIN_Y;
    
    private char[][] charMap = new char[14][25];
    private Tile[][] tileMap;
    private int rowSize, colSize;
    private int level;
    
    public void LevelAdd(int level) {
        this.level = level;
    }
    
    public int getLevel() {
        return level;
    }
    
    private void loadCharMap() {
        String[] lines = loadStrings("Assets/LevelMap/" + level + "LevelMap.txt");
        String[] data = new String[25];
        for (int i = 0; i < lines.length; i++) {
            data = lines[i].split(",");
            for (int j = 0;j < data.length;j++) {
                charMap[i][j] = data[j].charAt(0);
            }
        }
    }
    
    private void loadSetDate() {
        String[] lines = loadStrings("Assets/LevelMap/" + level + "LevelData.txt");
        ArrayList<Float> data = new ArrayList();
        for (int i=0;i<lines.length;i++) {
            data.add(Float.parseFloat(lines[i]));
        }
        FIREBOY_X = data.get(0);
        FIREBOY_Y = data.get(1);
        WATERGIRL_X = data.get(2);
        WATERGIRL_Y = data.get(3);
        PRIVATE_X = data.get(4);
        PRIVATE_Y = data.get(5);
        CUCUMBER_X = data.get(6);
        CUCUMBER_Y = data.get(7);
        BIGGUY_X = data.get(8);
        BIGGUY_Y = data.get(9);
        CAPTAIN_X = data.get(10);
        CAPTAIN_Y =  data.get(11);
    }
    
    public TileMap(int level) {
        this.level = level;
        loadCharMap();
        loadSetDate();
        this.rowSize = this.charMap.length;
        this.colSize = this.charMap[0].length;
        this.tileMap = new Tile[this.rowSize][this.colSize];
        makeTileMap();
    }
    
    private void makeTileMap() {
        for (int i = 0; i < this.rowSize; i++) {
            for (int j = 0; j < this.colSize; j++) {
                if (this.charMap[i][j] == '#') {
                    this.tileMap[i][j] = new Tile(i, j, "Obstacle");
                }
                // else if(this.charMap[i][j] == 'F'){
                //     this.tileMap[i][j] = new Tile(i, j, "Fire");    
            // }else if(this.charMap[i][j] == 'W'){
                //     this.tileMap[i][j] = new Tile(i, j, "Water");    
            // }else if(this.charMap[i][j] == 'P'){
                //     this.tileMap[i][j] = new Tile(i, j, "Poison");
            // }
                else if (this.charMap[i][j] == 'S') {
                    this.tileMap[i][j] = new Tile(i, j, "Start");
                } else if (this.charMap[i][j] == 'D') {
                    this.tileMap[i][j] = new Tile(i, j, "FireGate");
                } else if (this.charMap[i][j] == 'G') {
                    this.tileMap[i][j] = new Tile(i, j, "WaterGate");
                }
                else if (this.charMap[i][j] == 'B') {
                    this.tileMap[i][j] = new Tile(i, j, "Button");
                }
                else {
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
        for (int i = 0; i < this.rowSize; i++) {
            for (int j = 0; j < this.colSize; j++) {
                this.tileMap[i][j].display();
            }
        }
    }
    
}
