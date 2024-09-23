public class Scene3{
  
  int currentFrameCount = 0;
  int stopFrameCount = 1;
  int fadeSpeed= 20; 
  int alpha = 225;
    public void draw() {
      currentFrameCount++;
    }
    public void fadeIn(){      
      fill(0, 0, 0, alpha -= fadeSpeed );     
      rect(0,0, 1280, 832);  
    }


    public void fadeOut(){
      alpha = 0;
      fill(0, 0, 0, alpha += fadeSpeed );     
      rect(0,0, 1280, 832);  
    }


    public boolean isFinished() {
      return currentFrameCount >= stopFrameCount;  
    }
    
    void keyPressed(){
    }
    void keyReleased(){
    }
    void stop(){
    }
    void mouseClicked(){}
}
