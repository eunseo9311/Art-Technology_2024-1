public class ThirdScene extends Scene3{
  
  Minim minim;
  AudioPlayer player1; 
  AudioPlayer player2;
  Ship princeAndShip2;
  Ship princeAndShip1; 
  PImage _princeAndShip;
  PImage _back;
  PImage background;
  PImage wave1; 
  PImage wave2;  
  PImage textBox;
  PImage textBox2;
  HumanSide seja;
  HumanSide simchung;
  NarrationBox nr;
  
  int textBoxDelay = 0;
  
  public ThirdScene(PApplet p){     
     stopFrameCount = 640;
     minim = new Minim(p);
     player1 = minim.loadFile("ElevenLabs_2024-06-09T17_29_16_Dorothy_pre_s50_sb75_se0_b_m2.mp3");
     player2 = minim.loadFile("ElevenLabs_2024-06-09T17_32_33_Dorothy_pre_s50_sb75_se0_b_m2.mp3");
     
     seja = new Seja(335, 516);
     nr = new NarrationBox("The crown prince heard from Simcheong what had happened so far.", 0,0);
     simchung = new SimChungSide(927, 456);
     princeAndShip1 = new Ship(-53.17, 483.67);     
     princeAndShip2 = new Ship(55.38, 489.66);
     _back = loadImage("seja_boat_back.png");
     _princeAndShip = loadImage("seja_boat_front.png");
     background = loadImage("long_background.png");
     wave1 = loadImage("story_wave.png");
     wave2 = loadImage("story_wave2.png");
     textBox = loadImage("text_box.png");
     textBox2 = loadImage("text_box2.png");
    
     simchung.directionChange();
  }  
  
  public void draw(){
    super.draw();
      pushMatrix();
      pushMatrix();     
      player1.play();
      if(currentFrameCount < 100){
          translate(0, 300- currentFrameCount*3);      
      }
      
      image(background, 0, -300);
      
      image(wave2,0, 585.46);  
      
      princeAndShip1.boatFloat(_back, 0.01);     
      if(currentFrameCount > 340){
        seja.walk(0.002);
        if(currentFrameCount < 350){
            seja.armRightRotate(-0.06);   
        }
      }else {
        seja.stand();
      }
      if(currentFrameCount > 240 && currentFrameCount < 280){
         seja.headShake(0.01);
      }
      simchung.walk(0.001);
      princeAndShip1.boatFloat(_princeAndShip, 0.01);     
      
      pushMatrix();
      pushStyle();
      image(wave1, 0, 642.36);
      popStyle();
      popMatrix();
      pushMatrix();
      pushStyle();     
      if(currentFrameCount > 100 && currentFrameCount < 240) {
        if(currentFrameCount < 110){        
          simchung.armLeftRotate(-0.06);
        }
        image(textBox, 529.56, 177.42);       
      }
      if(currentFrameCount > 240 && currentFrameCount < 340){
        image(textBox2,  529.56,  177.42);      
      }
     
           popStyle();
      popMatrix();
      popMatrix();
      popMatrix();
      
      nr.draw();
      if(currentFrameCount > 340){
        player2.play();

        nr.message = "And he was so touched by Simcheong's filial piety that\n he promised to help Simcheong meet her father.";
        
      }
      
      
  }  

}
