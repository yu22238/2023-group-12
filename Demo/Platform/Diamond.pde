public class Diamond extends GameObject {

    private boolean isEaten=false;
    private Collider diamondColl;

    public boolean getEaten(){
        return isEaten;
    }


    public Diamond (float x, float y) {
        super(x, y, 40,30,"diamond");
        setImage(loadImage("Assets/Diamond/Diamond.png"));
        this.image.resize(40, 30);
        diamondColl=new Collider(x,y,40,30);
    }

    public void eatDiamond(){
        if(diamondColl.collideWith(game.fireboy.coll)||diamondColl.collideWith(game.watergirl.coll)){
            isEaten=true;
            println("eatsuccess");
        }
    }

    public void update() {
        if(isEaten==true){
            return;
        }
        eatDiamond();
    }
}