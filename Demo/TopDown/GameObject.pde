public class GameObject {
    public PVector position;
    public float w, h;
    private String tag;

    public GameObject(float x, float y, float w, float h, String tag) {
        this.position = new PVector(x, y);
        this.w = w;
        this.h = h;
        this.tag = tag;
    }

    public String getTag() {
        return this.tag;
    }

    public void update() {

    }

    public void display() {

    }
} 