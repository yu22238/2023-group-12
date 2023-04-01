public class Watergirl extends Player {
    public Watergirl (float x, float y, float w, float h, InputManager inputManager) {
        super(x, y, w, h);

        // set state machine and animation
        this.stateMachine = new StateMachine(this);
        this.animator = new Animator(this, "Assets/Watergirl");
        super.initAnimation();
        // set input manager
        this.inputManager = inputManager;
    }
}