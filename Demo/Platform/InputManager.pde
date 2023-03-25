public class InputManager {
    public Integer left;
    public Integer right;
    public Integer jump;
    public Integer fire;

    private ArrayList<Integer> keyList = new ArrayList<Integer>();

    public InputManager(char left, char right, char jump, char fire) {
        this.left = (int)left;
        this.right = (int)right;
        this.jump = (int)jump;
        this.fire = (int)fire;
    }

    public ArrayList<Integer> getKeyList() { return this.keyList; }

    public Integer getKey(Integer idx) { return this.keyList.get(idx); }

    public void appendKey(Integer c) { this.keyList.add(c); }

    public void removeKey(Integer c) { this.keyList.remove(c); }

    public Integer getKey() { 
        return this.keyList.get(this.keyList.size() - 1); 
    }

    public boolean isValidKey(int k) {
        if (k == left || k == right || k == jump || k == fire) {
            return true;
        }
        return false;
    }
}

InputManager inputManager1 = new InputManager('a', 'd', 'w', 'q');
InputManager inputManager2 = new InputManager('j', 'l', 'i', 'u');

void keyPressed() {
    if (inputManager1.isValidKey((int)key) && !inputManager1.getKeyList().contains((int)key)) {
        inputManager1.appendKey((int)key);
    }
    if (inputManager2.isValidKey((int)key) && !inputManager2.getKeyList().contains((int)key)) {
        inputManager2.appendKey((int)key);
    }
}

void keyReleased() {
    for (int i=inputManager1.getKeyList().size()-1; i >= 0; i--) {
        if (inputManager1.getKey(i) == (int)key) {
            inputManager1.removeKey((int)key);
        }
    }
    for (int i=inputManager2.getKeyList().size()-1; i >= 0; i--) {
        if (inputManager2.getKey(i) == (int)key) {
            inputManager2.removeKey((int)key);
        }
    }
}
