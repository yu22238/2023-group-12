public class Bullet extends GameObject{
    private PShape circle;
    private float speed;
    private PVector velocity;
    private Collider coll;

    public Bullet(float x, float y, PVector vel) {
        super(x, y, BULLET_SIZE, BULLET_SIZE);
        this.velocity = vel;
        this.circle = createShape(ELLIPSE, this.position.x, this.position.y, this.w, this.h);
        this.circle.setFill(color(255, 255, 0));
        this.coll = new Collider(x-this.w/2, y-this.h/2, this.w, this.h);
    }
  
    public void move() {
        this.position.add(this.velocity);
        this.circle.translate(this.velocity.x, this.velocity.y);
        this.coll.move(this.velocity.x, this.velocity.y);
    }
    
    public void update() {
        move();
    }
    
    public void display() {
        shape(this.circle);
    }
}