public class River extends GameObject {

    public Collider riverColl;
    public String riverType;

    public River (float x, float y,String riverType) {
        super(x+5, y,50,10,"River");
        this.riverType=riverType;
        if(riverType.equals("FireRiver")){
            setImage(loadImage("Assets/RiverTest/red.png"));
        }else if(riverType.equals("WaterRiver")){
            setImage(loadImage("Assets/RiverTest/blue.png"));
        }else if(riverType.equals("PoisonRiver")){
            setImage(loadImage("Assets/RiverTest/green.png"));
        }
        this.image.resize(50, 10);
        riverColl=new Collider(x+5,y,50,10);
    }

    public void update() {}
}