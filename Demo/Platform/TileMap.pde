public class TileMap {
    public ArrayList<Float> playerData = new ArrayList();
    public ArrayList<Float> enemyData = new ArrayList();
    public ArrayList<Float> diamondData = new ArrayList();
    public ArrayList<Float> doorData = new ArrayList();
    public ArrayList<Float> riverData = new ArrayList();
    
    private char[][] charMap = new char[14][25];
    private Tile[][] tileMap;
    private int rowSize, colSize;
    private int level;
    
    public TileMap(int level) {
        this.level = level;
        loadCharMap();
        loadLevelData("LevelPlayerData",playerData);
        loadLevelData("LevelEnemyData",enemyData);
        loadLevelData("LevelDiamondData",diamondData);
        loadLevelData("LevelDoorData",doorData);
        loadLevelData("LevelRiverData",riverData);
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
    
    private void loadLevelData(String fileName,ArrayList<Float> data) {
        String[] lines = loadStrings("Assets/LevelMap/" + level + "/" + fileName + ".txt");
        for (String line : lines) {
            data.add(Float.parseFloat(line));
        }
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
    
    
    private void makeTileMap() {
        for (int i = 0; i < this.rowSize; i++) {
            for (int j = 0; j < this.colSize; j++) {
                if (this.charMap[i][j] == '#') {
                    this.tileMap[i][j] = new Tile(i, j, "Obstacle");
                } else if (this.charMap[i][j] == 'F') {
                    this.tileMap[i][j] = new Tile(i, j, "Fire");    
                } else if (this.charMap[i][j] == 'W') {
                    this.tileMap[i][j] = new Tile(i, j, "Water");    
                } else if (this.charMap[i][j] == 'P') {
                    this.tileMap[i][j] = new Tile(i, j, "Poison");
                } else if (this.charMap[i][j] == 'S') {
                    this.tileMap[i][j] = new Tile(i, j, "Start");
                } else if (this.charMap[i][j] == 'B') {
                    this.tileMap[i][j] = new Tile(i, j, "Button");
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
        for (int i = 0; i < this.rowSize; i++) {
            for (int j = 0; j < this.colSize; j++) {
                this.tileMap[i][j].display();
            }
        }
    }
    
    
    
}
