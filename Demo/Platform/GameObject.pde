public class GameObject {
    public PVector position;
    public float w, h;
    private String tag;
    protected PImage image;
    protected PVector velocity;
    protected State state;

    public GameObject(float x, float y, float w, float h, String tag) {
        this.position = new PVector(x, y);
        this.w = w;
        this.h = h;
        this.tag = tag;
    }

    public PVector getVelocity() { return this.velocity; }
    public State getState() { return this.state; }
    public void setState(State state) { this.state = state; }
    public String getTag() { return this.tag; }
    public PImage getImage() { return this.image; }
    public void setImage(PImage img) { this.image = img; }

    public void update() {

    }

    public void display() {

    }
} 