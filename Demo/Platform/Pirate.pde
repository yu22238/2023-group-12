public class Pirate extends Enemy {
    private float idleTime = 20;
    private float idleCnt = 0;
    private boolean isIdle = false;

    public Pirate (float x, float y, float w, float h) {
        super(x, y, w, h);

        setImage(loadImage("Assets/Pirate/1.png"));
        this.image.resize((int)w, (int)h);

        this.animator = new Animator(this, "Assets/Pirate");
        this.animator.setAnimation(State.IDLE_L, "Idle_L", 34, int(w), int(h), true);
        this.animator.setAnimation(State.IDLE_R, "Idle_R", 34, int(w), int(h), true);
        this.animator.setAnimation(State.WALK_L, "Run_L", 14, int(w), int(h), true);
        this.animator.setAnimation(State.WALK_R, "Run_R", 14, int(w), int(h), true);
        this.animator.setAnimation(State.DEAD_L, "Dead_L", 12, int(w), int(h), false);
        this.animator.setAnimation(State.DEAD_R, "Dead_R", 12, int(w), int(h), false);
    }
}
