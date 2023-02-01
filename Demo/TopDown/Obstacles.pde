public class Obstacles {
    ArrayList<Obstacle> obstacles;

    public Obstacles () {
        this.obstacles = new ArrayList<Obstacle>();
    }
    
    public void display() {
        for (Obstacle ob: this.obstacles) {
            ob.display();
        }
    }
}
