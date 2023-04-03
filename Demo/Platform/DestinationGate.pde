public class DestinationGate extends GameObject {
    private boolean inDestination;
    private Collider gateColl;
    String gateName;
    private boolean isOpened=false;
    
    public DestinationGate(float x, float y,String gateName) {
        super(x, y, 60,60,"Gate");
        setImage(loadImage("Assets/Door/" + gateName + ".png"));
        this.image.resize(60, 70);
        gateColl = new Collider(x,y,60,80);
        this.gateName = gateName;
    }
    
    public void inGate() {
        if (gateName.equals("Fire")) {
            if (gateColl.collideWith(game.fireboy.coll)) {
                inDestination = true;
            }
        } else if (gateName.equals("Water")) {
            if (gateColl.collideWith(game.watergirl.coll)) {
                inDestination = true;
            }
        }
        
    }
    
    public void update() {
        if(isOpened){
            return;
        }else if (inDestination ==  true) {
            setImage(loadImage("Assets/Door/Opened.png"));
            this.image.resize(60, 70);
            isOpened=true;
            gateColl=null;
            return;
        }
        inGate();
    }
}