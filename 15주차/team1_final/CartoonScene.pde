public class CartoonScene extends Scene3 {
  PImage background1;
  PImage background2;
  PImage background3;
  PImage boatImage;
  PImage frame;
  PImage suImage;
  PImage simchung;
  float simchungX = 1280;
    
  Minim minim;
  AudioPlayer player1; 
  AudioPlayer player2;
  AudioPlayer player3;

  int boatTime;
  int suTime;
  int simchungTime;
  int firstTint= 200;
  int secondTint= 200;  
  int thirdTint= 200;
  int position = 0;

  Su su;
  Ship boat;
  public CartoonScene(PApplet p) {
    minim = new Minim(p);
    background1 = loadImage("cartoon_background1.png");
    background2 = loadImage("cartoon_background2.png");
    background3 = loadImage("cartoon_background3.png");
    boatImage = loadImage("cartoon_boat.png");
    frame = loadImage("cartoon_frame.png");
    suImage = loadImage("su.png");
    su = new Su(855.86, 335.55);
    simchung = loadImage("run_simchung.png");
    boat = new Ship(461.92, 424);
    
    
  }

  @Override
    public void draw() {
    pushStyle();    
    colorMode(HSB, 400, 400, 400);
    tint(0, 0, firstTint);
    if(position > 0){
      
      firstTint+=20;
    }
    image(background1, 0, 0);
    popStyle();

    boat.boatFloat(boatImage, 0.2);
    if (boatTime < 360 && position> 0) {
      boat.moveBoat(-0.6);
    }
    pushStyle();
    colorMode(HSB, 400, 400, 400);
    tint(0, 0, secondTint);
    if(position > 1){
      secondTint += 20;
    }   
    image(background2, 443, 14);
    popStyle();

    su.jump(suImage, suTime*35);
    pushStyle();    
    colorMode(HSB, 400, 400, 400);
    tint(0, 0, thirdTint);
    if(position > 2){
      thirdTint += 20;
      
    }
    image(background3, 863, 0);   
    if(position > 2){
      image(simchung, simchungX, 559);
      if(simchungTime < 85){
        simchungX -= 5;
      }
    }
    popStyle();
    image(frame, 0, 0);   
    if (position == 1) {
      boatTime++;
    } else if (position == 2 && suTime < 10) {
      suTime++;
    }else if (position >= 3 ){
      simchungTime++;
    }

      
  }
  void startTime() {
    boatTime++;
    if (suTime < 10 && boatTime > 400) {
      suTime++;
    }
  }

  void mouseClicked() {
    position++;
  }
  boolean isFinished() {
    return position > 3;
  }
}
