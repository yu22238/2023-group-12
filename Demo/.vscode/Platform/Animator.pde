import java.io.File;
// used to manage animation transition for player and enemies

public class Animator {
    Character parent;
    HashMap<State, Animation> animations;
    String baseFilePath;
    State currentAnimationState;

    public Animator(Character obj, String baseFilePath) {
        this.parent = obj;
        this.animations = new HashMap<State, Animation>();
        this.baseFilePath = baseFilePath.replace("/", File.separator);
    }

    public void setAnimation(State state, String filePath, int nums, float w, float h, boolean loop) {
        Animation anim = new Animation(this.baseFilePath + File.separator + filePath, nums, w, h, loop);
        this.animations.put(state, anim);     
    }

    public Animation getAnimation(State state) {
        return this.animations.get(state);
    }

    // play corresponding animation clip based on the state of its parent
    public void playAnimation() {
        Animation anim = this.animations.get(this.parent.getState());
        if (anim == null) { return; }
        if (this.currentAnimationState != this.parent.getState()) {
            anim.setCurrentFrameIdx(0);
            this.currentAnimationState = this.parent.getState();
        }
        if (anim.getCurrentFrameIdx() >= anim.getFrameNum()) {
            if (anim.isLoop()) {
                anim.setCurrentFrameIdx(0);
            } else {
                anim.setCurrentFrameIdx(anim.getFrameNum() - 1);
            }
        }
        this.parent.setImage(anim.getCurrentFrame());
        anim.updateFrameIdx();
    }
}
