public class LevelManager{

    public int mode=0;

    private int startMode = 0;
    private int level1 = 1;
    private int level2 = 2;
    private int level3 = 3;
    private int endMode = 4;

    public LevelManager(){
      this.mode = 0;
    }

    public void display(){

      if(mode == startMode){
        startScreen.display();
      }
      
      if(mode == level1 || mode == level2 || mode == level3){
        background(51);
        game.display();
        checkForReset();
        checkCompletedLevel();
      }

    }
    
    public void checkForReset(){
      if (keyPressed && (key == 'r' || key == 'R')) {
            // game = new Game(); // Restart the game
            game.restartLevel();
        }
    }
    
    public void checkCompletedLevel(){
      if(game.diamonds.getDiamondNumber()==0 && game.fireboy.finish==true && game.watergirl.finish==true){
         incrementLevel();
      }
    }
    
    public void incrementLevel(){
      mode++;
      level++;
      // game = new Game();
      game.restartLevel();
    }

}
