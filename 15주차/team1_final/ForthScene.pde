public class ForthScene extends Scene3 {
  PImage background;
  PImage textBox;
  
  HumanSide dad;
  
  HumanSide simChung;
  int walkCount;
  
  public ForthScene() {
    stopFrameCount = 280;
    background = loadImage("dad_background.png");
    textBox = loadImage("father_text_box.png");
    simChung = new SimChungSide(1280, 903);
    dad = new Dad(235, 903);
    simChung.directionChange();
  }
  public void draw(){
    super.draw();
    background(#D5E8FF);  
    pushMatrix();
    walkCount++;
    scale(0.7);
    image(background,0,116);
    if(walkCount < 160){
        dad.walk(0.01);    
    }else {
      dad.stand();
    }    
    if(walkCount > 190 && walkCount < 250) {
      image(textBox, 1079, 360, 751, 411);
    }    
    if(walkCount> 230 && walkCount < 250){
      pushMatrix();
      
      simChung.run(0.15);     
      popMatrix();
    }    
    if(walkCount> 250){
      pushMatrix();
      simChung.stand();
      popMatrix();
    }
    
    popMatrix();
  }
  
}
