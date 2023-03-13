// used to manage state transition for player and enemy

public class StateMachine {
    private State state;
    private GameObject parent;

    public StateMachine(GameObject obj) {
        this.parent = obj;
        this.parent.setState(State.IDLE);
    }

    public void updateState() {
        if (parent.getVelocity().x == 0 && parent.getVelocity().y == 0) {
            parent.setState(State.IDLE);
        } else if (parent.getVelocity().y > 0) {
            parent.setState(State.FALL);
        } else if (parent.getVelocity().y < 0) {
            parent.setState(State.JUMP);
        } else if (parent.getVelocity().x != 0) {
            parent.setState(State.WALK);
        }
    }
}
