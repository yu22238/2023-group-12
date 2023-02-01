public class Map {

    public Map () {
        for (int i=0; i<int(width/TILE_SIZE); i++) {
            obstacles.obstacles.add(new Obstacle(i*TILE_SIZE, 0));
            obstacles.obstacles.add(new Obstacle(i*TILE_SIZE, height-TILE_SIZE));
        }
        for (int i=0; i<int(height/TILE_SIZE); i++) {
            obstacles.obstacles.add(new Obstacle(0, i*TILE_SIZE));
            obstacles.obstacles.add(new Obstacle(width-TILE_SIZE, i*TILE_SIZE));
        }
    }
}
