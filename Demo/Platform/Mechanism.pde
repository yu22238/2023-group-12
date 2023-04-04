public class Mechanism {
    private ArrayList<Button> buttonList=new ArrayList();
    private ArrayList<Blocker> blockerList=new ArrayList();


    public void buttonListAdd(Button button) {
        buttonList.add(button);
    }

    public void blockerListAdd(Blocker blocker) {
        blockerList.add(blocker);
    }

    public void display(){
        for(int i=0;i<buttonList.size();i++){
            buttonList.get(i).display();
            blockerList.get(i).display();
        }
    }

    public void update(){
        for(int i=0;i<buttonList.size();i++){
            buttonList.get(i).update();
            blockerList.get(i).setbuttonPush(buttonList.get(i).getPush());
            blockerList.get(i).update();
        }
    }

}