import java.util.Iterator;

public class InputManager {

    private boolean isFireboy;
    private Object left;
    private Object right;
    private Object jump;
    private Object fire;

    private ArrayList<InputKey> keyList = new ArrayList<>();

    public InputManager(boolean isFireboy, Object left, Object right, Object jump, Object fire) {
        this.isFireboy = isFireboy;
        this.left = left;
        this.right = right;
        this.jump = jump;
        this.fire = fire;
    }

    public ArrayList<InputKey> getKeyList() { return this.keyList; }

    public InputKey getKeyById(Integer idx) { return this.keyList.get(idx); }

    public void appendKeyIfNotExist(InputKey inputKey) {
        if (inputKey == null) {
            return;
        }
        
        if (!this.getKeyList().contains(inputKey)) {
            this.keyList.add(inputKey);
        }
    }

    public void removeKeyIfExist(InputKey inputKey) {
        Iterator<InputKey> iterator = this.getKeyList().iterator();
        while (iterator.hasNext()) {
            InputKey currentKey = iterator.next();
            if (currentKey.equals(inputKey)) {
                iterator.remove();
            }
        }
    }

    public InputKey getLastKey() { 
        return this.keyList.get(this.keyList.size() - 1); 
    }

    // return a enum related to the input
    // return null if input is not a valid key
    public InputKey getValidKey(Object k) {
        // fireboy
        if (isFireboy) {
            if (left.equals(k) || ((Object)'A').equals(k)) {
                return InputKey.LEFT;
            }
            if (right.equals(k) || ((Object)'D').equals(k)) {
                return InputKey.RIGHT;
            }
            if (jump.equals(k) || ((Object)'W').equals(k)) {
                return InputKey.JUMP;
            }
            if (fire.equals(k) || ((Object)'Q').equals(k)) {
                return InputKey.FIRE;
            }
        } else {
            // watergirl
            if (left.equals(k)) {
                return InputKey.LEFT;
            }
            if (right.equals(k)) {
                return InputKey.RIGHT;
            }
            if (jump.equals(k)) {
                return InputKey.JUMP;
            }
            if (fire.equals(k)) {
                return InputKey.FIRE;
            }
        }
        
        return null;
    }
}

InputManager inputManagerFire = new InputManager(true, 'a', 'd', 'w', 'q');
InputManager inputManagerWater = new InputManager(false, LEFT, RIGHT, UP, '/');

void keyPressed() {
    // detect special keys such as UP, DOWN, LEFT, RIGHT
    Object keyValue = null;
    if (key == CODED) {
        keyValue = keyCode;
    } else {
        keyValue = key;
    }
    
    // fireboy
    inputManagerFire.appendKeyIfNotExist(inputManagerFire.getValidKey(keyValue));
    // watergirl
    inputManagerWater.appendKeyIfNotExist(inputManagerWater.getValidKey(keyValue));
}

void keyReleased() {
    // detect special keys such as UP, DOWN, LEFT, RIGHT
    Object keyValue = null;
    if (key == CODED) {
        keyValue = keyCode;
    } else {
        keyValue = key;
    }

    // fireboy
    InputKey keyFireboy = inputManagerFire.getValidKey(keyValue);
    for (int i = 0; i < inputManagerFire.getKeyList().size(); i++) {
        if (inputManagerFire.getKeyById(i).equals(keyFireboy)) {
            inputManagerFire.removeKeyIfExist(keyFireboy);
        }
    }

    // watergirl
    InputKey keyWatergirl = inputManagerWater.getValidKey(keyValue);
    for (int i = 0; i < inputManagerWater.getKeyList().size(); i++) {
        if (inputManagerWater.getKeyById(i).equals(keyWatergirl)) {
            inputManagerWater.removeKeyIfExist(keyWatergirl);
        }
    }
}