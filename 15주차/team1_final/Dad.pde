public class Dad extends HumanSide {
   int direction;
  int rotateCount;
  
  public Dad(int x, int y){
      super(x, y);
      body = loadImage("dad_body.png");
      leg = loadImage("dad_leg.png");
      head = loadImage("dad_head.png");
      armRight = loadImage("dad_arm_right.png");
      armLeft = loadImage("dad_arm_left.png");
      footRight = loadImage("dad_foot.png");
      footLeft = loadImage("dad_foot.png");
      headY = -163;
      headX = headX -23;
      legX = legX + 10;
      legY = legY + 10;
      
      
  }
  @Override
  public void draw(){    
    super.draw();
  }
  public void drawPart(PImage image, float x, float y, float cX, float cY){ 
    pushMatrix();
    
    translate(0 + x, 0 + y);
    image(image, cX, cY);
    
    popMatrix();
  }


  public void stand(){
    pushMatrix();  
    translate(centerX, centerY);     
    draw();
    popMatrix();
  }

}
