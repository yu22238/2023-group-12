public class Map {

    public Map () {
        for (int i=0; i<int(width/TILE_SIZE); i++) {
            obstacles.obstacles.add(new Obstacle(i*TILE_SIZE, 0, "Platform"));
            obstacles.obstacles.add(new Obstacle(i*TILE_SIZE, height-TILE_SIZE, "Platform"));
        }
        for (int i=0; i<int(height/TILE_SIZE); i++) {
            obstacles.obstacles.add(new Obstacle(0, i*TILE_SIZE, "Obstacle"));
            obstacles.obstacles.add(new Obstacle(width-TILE_SIZE, i*TILE_SIZE, "Obstacle"));
        }

        for (int i=3; i<6; i++) {
            obstacles.obstacles.add(new Obstacle(i*TILE_SIZE, 10*TILE_SIZE, "Platform"));
        }
    }
}
