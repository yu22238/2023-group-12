public class Rivers {
    public ArrayList<River> riverList = new ArrayList();
    
    public void riverListAdd(River river) {
        riverList.add(river);
    }
    
    public void display() {
        for (River river : this.riverList) {
            river.display();
        }
    }
    
}