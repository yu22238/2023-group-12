// The base class for every object in scene

public abstract class GameObject {
    // the position for top left corner of the object
    public PVector position;
    // the width and height for the object
    public float w, h;
    // the "name" for the object, used to differentiate objects
    private String tag;
    // the "look" of the objects
    protected PImage image;
    // A 2D vector, define displacement (how much position changes) per frame
    // velocity.x is the horizontal displacement per frame
    // velocity.y is the vertical displacement per frame
    // used when the object is movable
    protected PVector velocity;
    // indicate the current state of the object (IDLE, WALK, JUMP ...)
    protected State state;

    public GameObject(float x, float y, float w, float h, String tag) {
        this.position = new PVector(x, y);
        this.w = w;
        this.h = h;
        this.tag = tag;
    }

    public PVector getVelocity() { return this.velocity; }
    public State getState() { return this.state; }
    // public void setState(State state) { this.state = state; }
    public String getTag() { return this.tag; }
    public PImage getImage() { return this.image; }
    public void setImage(PImage img) { this.image = img; }

    // update is called every frame (in draw())
    public abstract void update();

    public void display() {
        image(this.image, this.position.x, this.position.y);
    }
} 
