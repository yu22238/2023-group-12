public class Button extends GameObject {
    private Collider coll;
    private boolean push=false;

    public boolean getPush(){
        return push;
    }
    
    public Button(float x, float y) {
        super(x, y, 50,20,"Button");
        setImage(loadImage("Assets/Mechanism/Button.png"));
        this.image.resize(50,20);
        coll = new Collider(x,y,50,20);
    }

    public void update() {
        if(push==true){
            coll=null;
            return;
        }
        if(coll.collideWith(game.fireboy.coll)||coll.collideWith(game.watergirl.coll)){
            push=true;
            setImage(loadImage("Assets/Mechanism/ButtonPush.png"));
            this.image.resize(50,20);
        }
    }
}