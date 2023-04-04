public class Blocker extends GameObject {
    private Collider coll;
    private float blockerType;
    private float blockDirection;
    private boolean activate = false;
    private boolean push = false;
    private float x;
    private float y;
    private float w;
    private float h;
    
    public Blocker(float x, float y,float blockerType,float blockDirection) {
        super(x, y, 0,0,"Blocker");
        this.x = x;
        this.y = y;
        this.blockerType = blockerType;
        this.blockDirection = blockDirection;
        if (blockerType ==  1) {
            w = 30;
            h = 90;
            setImage(loadImage("Assets/Mechanism/blocker_v.png"));
        } else{
            w = 90;
            h = 30;
            setImage(loadImage("Assets/Mechanism/blocker_h.png"));
        }
        this.w = w;
        this.h = h;
        setWidth(w);
        setHeight(h);
        this.image.resize((int)w,(int)h);
        coll = new Collider(x,y,w,h);
        
    }
    
    public void setbuttonPush(boolean push) {
        this.push = push;
    }
    
    public void update() {
        if (activate) {
            return;
        }
        if (push) {
            //vertical blocker
            if (blockerType ==  1) {
                //move up
                if (blockDirection ==  1) {
                    if ((this.y - h) !=  position.y) {
                        setPosition(x,position.y - 1);
                        coll = new Collider(x,position.y,w,h);
                    } else{
                        activate = true;
                    }
                    //move down
                } else{
                    if ((this.y + h) !=  position.y) {
                        setPosition(x,position.y + 1);
                        coll = new Collider(x,position.y,w,h);
                    } else{
                        activate = true;
                    }
                }
                //horizonal blocker
            } else{
                //move left
                if (blockDirection ==  1) {
                    if ((this.x - w) !=  position.x) {
                        setPosition(position.x - 1,y);
                        coll = new Collider(position.x,y,w,h);
                    } else{
                        activate = true;
                    }
                    //move right
                } else{
                    if ((this.x + w) !=  position.x) {
                        setPosition(position.x + 1,y);
                        coll = new Collider(position.x,y,w,h);
                    } else{
                        activate = true;
                    }
                }
            }
        }
        
    }
}