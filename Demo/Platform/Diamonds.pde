public class Diamonds {
    private ArrayList<Diamond> diamondList=new ArrayList();

    public void diamondListAdd(Diamond diamond){
        diamondList.add(diamond);
    }

    public void display(){
        for(Diamond diamond: this.diamondList){
            if(diamond.isEaten==true){
                continue;
            }
            else{
                diamond.display();
            }
        }
    }

    public void update() {
        for (Diamond diamond: this.diamondList) {
            diamond.update();  
        }
    }
    //for level manager to get diamonds number and judge whether win
    public int getDiamondNumber(){
        int cnt=0;
        for(Diamond diamond: this.diamondList){
            if(diamond.isEaten==false)
            cnt++;
        }
        return cnt;
    }

}