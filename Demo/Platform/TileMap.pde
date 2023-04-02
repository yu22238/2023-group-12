public class TileMap {
    // public float[] characterArr={FIREBOY_X,FIREBOY_Y,}
    public float FIREBOY_X;
    public float FIREBOY_Y;
    public float WATERGIRL_X;
    public float WATERGIRL_Y;
    public float PRIVATE_X;
    public float PRIVATE_Y;
    public float PRIVATE_LEFT;
    public float PRIVATE_RIGHT;
    public float CUCUMBER_X;
    public float CUCUMBER_Y;
    public float CUCUMBER_LEFT;
    public float CUCUMBER_RIGHT;
    public float BIGGUY_X;
    public float BIGGUY_Y;
    public float BIGGUY_LEFT;
    public float BIGGUY_RIGHT;
    public float CAPTAIN_X;
    public float CAPTAIN_Y;
    public float CAPTAIN_LEFT;
    public float CAPTAIN_RIGHT;
    public float DIAMOND_X_1;
    public float DIAMOND_Y_1;
    public float DIAMOND_X_2;
    public float DIAMOND_Y_2;
    public float DIAMOND_X_3;
    public float DIAMOND_Y_3;
    
    private char[][] charMap = new char[14][25];
    private Tile[][] tileMap;
    private int rowSize, colSize;
    private int level;
    
    public TileMap(int level) {
        this.level = level;
        loadCharMap();
        loadCharacterData();
        loadDiamondData();
        this.rowSize = this.charMap.length;
        this.colSize = this.charMap[0].length;
        this.tileMap = new Tile[this.rowSize][this.colSize];
        makeTileMap();
    }

    public void LevelAdd(int level) {
        this.level = level;
    }
    
    public int getLevel() {
        return level;
    }
    
    private void loadCharMap() {
        String[] lines = loadStrings("Assets/LevelMap/" + level + "/LevelMap.txt");
        String[] data = new String[25];
        for (int i = 0; i < lines.length; i++) {
            data = lines[i].split(",");
            for (int j = 0;j < data.length;j++) {
                charMap[i][j] = data[j].charAt(0);
            }
        }
    }
    
    private void loadCharacterData() {
        String[] lines = loadStrings("Assets/LevelMap/" + level + "/LevelCharacterData.txt");
        ArrayList<Float> data = new ArrayList();
        for (int i = 0;i < lines.length;i++) {
            data.add(Float.parseFloat(lines[i]));
        }
        FIREBOY_X = data.get(0);
        FIREBOY_Y = data.get(1);
        WATERGIRL_X = data.get(2);
        WATERGIRL_Y = data.get(3);
        PRIVATE_X = data.get(4);
        PRIVATE_Y = data.get(5);
        PRIVATE_LEFT = data.get(6);
        PRIVATE_RIGHT = data.get(7);
        CUCUMBER_X = data.get(8);
        CUCUMBER_Y = data.get(9);
        CUCUMBER_LEFT = data.get(10);
        CUCUMBER_RIGHT = data.get(11);
        BIGGUY_X = data.get(12);
        BIGGUY_Y = data.get(13);
        BIGGUY_LEFT = data.get(14);
        BIGGUY_RIGHT = data.get(15);
        CAPTAIN_X = data.get(16);
        CAPTAIN_Y =  data.get(17);
        CAPTAIN_LEFT = data.get(18);
        CAPTAIN_RIGHT = data.get(19);
    }
    
    private void loadDiamondData() {
        String[] lines = loadStrings("Assets/LevelMap/" + level + "/LevelDiamondData.txt");
        ArrayList<Float> data = new ArrayList();
        for (int i = 0;i < lines.length;i++) {
            data.add(Float.parseFloat(lines[i]));
        }
        DIAMOND_X_1 = data.get(0);
        DIAMOND_Y_1 = data.get(1);
        DIAMOND_X_2 = data.get(2);
        DIAMOND_Y_2 = data.get(3);
        DIAMOND_X_3 = data.get(4);
        DIAMOND_Y_3 = data.get(5);
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
