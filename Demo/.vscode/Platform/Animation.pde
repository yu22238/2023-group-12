// for constructing animation clip

public class Animation {
    private ArrayList<PImage> frames = new ArrayList<PImage>();
    private String filePath;
    private int frameNum;
    private boolean loop;
    private float w, h;
    private float frameIdx = 0;
    private float playSpeed = 0.4;
    private boolean enterAnimation = true;

    public Animation (String filePath, int frameNum, float w, float h, boolean loop) {
        this.filePath = filePath;
        this.frameNum = frameNum;
        this.w = w;
        this.h = h;
        this.loop = loop;
        setFrames();
    }

    public boolean isLoop() { return this.loop; }

    private void setFrames() {
        for (int i=1; i<this.frameNum+1; i++) {
            PImage img = loadImage(this.filePath + "/" + i + ".png");
            img.resize(int(this.w), int(this.h));
            this.frames.add(img);
        }
    }

    public ArrayList<PImage> getFrames() { return this.frames; }

    public int getFrameNum() { return this.frameNum; }

    public int getCurrentFrameIdx() { return int(this.frameIdx); }

    public void setCurrentFrameIdx(int idx) { this.frameIdx = idx; }

    public void updateFrameIdx() {
        this.frameIdx += this.playSpeed;
    }

    public PImage getCurrentFrame() {
        return this.frames.get(int(this.frameIdx));
    }

    public boolean isEnterAnimation() { return this.enterAnimation; }
}
