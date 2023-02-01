public class InputManager {

    public InputManager () {
        
    }

    public int getHorizontalInput() {
        if (keyPressed) {
            if (key == 'a' || key == 'A') {
                return -1;
            }
            if (key == 'd' || key == 'D') {
                return 1;
            }
        } else {
            return 0;
        }
        return 0;
    }

    public int getVerticalInput() {
        if (keyPressed) {
            if (key == 'w' || key == 'W') {
                return -1;
            }
            if (key == 's' || key == 'S') {
                return 1;
            }
        } else {
            return 0;
        }
        return 0;
    }

    public boolean getFire() {
        if (mousePressed) {
            return true;
        }
        return false;
    }
}
