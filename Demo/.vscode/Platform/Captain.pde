public class Captain extends Enemy {

    public Captain(float x, float y, float w, float h) {
        super(x, y, w, h);

        setImage(loadImage("Assets/Captain/1.png"));
        this.image.resize((int)w, (int)h);

        this.animator = new Animator(this, "Assets/Captain");
        this.animator.setAnimation(State.IDLE_L, "Idle_L", 32, int(w), int(h), true);
        this.animator.setAnimation(State.IDLE_R, "Idle_R", 32, int(w), int(h), true);
        this.animator.setAnimation(State.WALK_L, "Run_L", 14, int(w), int(h), true);
        this.animator.setAnimation(State.WALK_R, "Run_R", 14, int(w), int(h), true);
        this.animator.setAnimation(State.DEAD_L, "Dead_L", 6, int(w), int(h), false);
        this.animator.setAnimation(State.DEAD_R, "Dead_R", 6, int(w), int(h), false);
    }
}
