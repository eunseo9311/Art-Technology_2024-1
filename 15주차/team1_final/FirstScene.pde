public class FirstScene extends Scene3 {
  
  Minim minim;
  AudioPlayer player; 
  AudioPlayer player2;
  Ship smallShip;
  Ship princeAndShip;
  PImage simchungShadow;
  PImage _princeAndShip;
  PImage _princeAndShip2;
  PImage wave1;
  PImage wave2;
  PImage cloud;
  PImage mountain;
  PImage _smallShip;
  int time = 0;
  NarrationBox nrBox;
  
  public FirstScene(PApplet p) {
    
    minim = new Minim(p);
    nrBox = new NarrationBox("The Crown Prince, passing by on a boat,\n found Simcheong drowning in Indangsu.", 400, 500);
     player = minim.loadFile("wave.mp3");
     player2 = minim.loadFile("ElevenLabs_2024-06-09T16_56_27_Dorothy_pre_s50_sb75_se0_b_m2.mp3");
     
     
     stopFrameCount = 240;
     smallShip = new Ship(1142,504);
     princeAndShip = new Ship( -721, 474);
     _princeAndShip = loadImage("prince_and_ship.png");
     _princeAndShip2 = loadImage("prince_and_ship_back.png");
     mountain = loadImage("mountain.png");     
     wave1 = loadImage("wave1.png");
     cloud = loadImage("cloud.png");
     wave2 = loadImage("wave2.png");
     simchungShadow = loadImage("small_sim_chung.png");   
     _smallShip = loadImage("main_ship_small.png");
     

  }
  @Override
  public void draw() {  
     player.play();
     player2.play();
     player.cue(8000);
     player.setGain(-10);
    super.draw();     
      time++;
      background(#C5DFFF);
      image(mountain, -204.69, 388.2);     
      pushMatrix();
      scale(0.7);
      smallShip.boatFloat(_smallShip,0.4);
      image(simchungShadow, 1124, 804+time);
      image(cloud, 1100, 100);      
      image(cloud, 300, 30);
      image(wave1, 0, 832);
      if(currentFrameCount > 120){
        princeAndShip.boatFloat(_princeAndShip, 0.4);
        if(currentFrameCount> 150){
          princeAndShip.event();          
        }
      }else{
        princeAndShip.boatFloat(_princeAndShip2, 0.4);      
      }
      princeAndShip.moveBoat(0.5);
      image(wave2, -97, 900);     
      
      image(wave2, -97, 940);     
      popMatrix();
      nrBox.draw();
  }
  void stop(){
    player.pause();
    player.close();
    minim.stop();
  }
  
}
