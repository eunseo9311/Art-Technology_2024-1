public class SimChungSide extends HumanSide{
  PImage hair;
  int direction;
  int rotateCount;
  
  public SimChungSide(int x, int y){
      super(x, y);
      hair = loadImage("sim_chung_side_hair.png");
      body = loadImage("sim_chung_side_body.png");
      leg = loadImage("sim_chung_side_leg.png");
      head = loadImage("sim_chung_head_sad.png");
      armRight = loadImage("sim_chung_side_arm_right.png");
      armLeft = loadImage("sim_chung_side_arm_left.png");
      footRight = loadImage("sim_chung_side_foot.png");
      footLeft = loadImage("sim_chung_side_foot.png");
  }
  @Override
  public void draw(){
    drawPart(hair,-70, -60, 0,-40 );
    super.draw();

  }
  public void drawPart(PImage image, float x, float y, float cX, float cY){ 
    pushMatrix();
    
    translate(0 + x, 0 + y);
    image(image, cX, cY);
    
    popMatrix();
  }


  public void stand(){
    super.stand();
  }
  
}
