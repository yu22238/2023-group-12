// used to manage state transition for player and enemy

public class StateMachine {
    private State state;
    private Character parent;

    public StateMachine(Character obj) {
        this.parent = obj;
        this.parent.setState(State.IDLE_R);
    }

    public void updateState() {
        if (parent.isDead()) {
            if (parent.facing == 1) { parent.setState(State.DEAD_R); }
            if (parent.facing == -1) { parent.setState(State.DEAD_L); }
        } else if (parent.getVelocity().x == 0 && parent.getVelocity().y == 0) {
            if (parent.facing == 1) { parent.setState(State.IDLE_R); }
            if (parent.facing == -1) { parent.setState(State.IDLE_L); }
        } else if (parent.getVelocity().y > 0) {
            if (parent.facing == 1) { parent.setState(State.FALL_R); }
            if (parent.facing == -1) { parent.setState(State.FALL_L); }
        } else if (parent.getVelocity().y < 0) {
            if (parent.facing == 1) { parent.setState(State.JUMP_R); }
            if (parent.facing == -1) { parent.setState(State.JUMP_L); }
        } else if (parent.getVelocity().x != 0) {
            if (parent.facing == 1) { parent.setState(State.WALK_R); }
            if (parent.facing == -1) { parent.setState(State.WALK_L); }
        }
    }
}
