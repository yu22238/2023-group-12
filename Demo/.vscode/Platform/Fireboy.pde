public class Fireboy extends Player {
    
    public Fireboy (float x, float y, float w, float h, InputManager inputManager) {
        super(x, y, w, h);

        // set state machine and animation
        this.stateMachine = new StateMachine(this);
        this.animator = new Animator(this, "Assets/Fireboy");
        super.initAnimation();
        // set input manager
        this.inputManager = inputManager;
    }
}
