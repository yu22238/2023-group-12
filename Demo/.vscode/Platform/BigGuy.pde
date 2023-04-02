public class BigGuy extends Enemy {

    public BigGuy (float x, float y, float w, float h) {
        super(x, y, w, h);

        setImage(loadImage("Assets/BigGuy/1.png"));
        this.image.resize((int)w, (int)h);

        this.animator = new Animator(this, "Assets/BigGuy");
        this.animator.setAnimation(State.IDLE_L, "Idle_L", 38, int(w), int(h), true);
        this.animator.setAnimation(State.IDLE_R, "Idle_R", 38, int(w), int(h), true);
        this.animator.setAnimation(State.WALK_L, "Run_L", 16, int(w), int(h), true);
        this.animator.setAnimation(State.WALK_R, "Run_R", 16, int(w), int(h), true);
        this.animator.setAnimation(State.DEAD_L, "Dead_L", 12, int(w), int(h), false);
        this.animator.setAnimation(State.DEAD_R, "Dead_R", 12, int(w), int(h), false);
    }
}
