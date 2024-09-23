import ddf.minim.*;


public class SecondScene extends Scene3{
  PImage wave; 
  
  NarrationBox nr;
  Minim minim;
  AudioPlayer player;
  AudioPlayer player2;
  Spray bubble;
  Shadow shadow;
  int count = 0;
  public SecondScene(PApplet p) {   
    minim = new Minim(p);
    stopFrameCount = 120;
    wave = loadImage("semi_wave.png");
    
    player = minim.loadFile("foley-water-splash-01.mp3");
    
    player2 = minim.loadFile("ElevenLabs_2024-06-09T19_16_12_Dorothy_pre_s50_sb75_se0_b_m2.mp3");
    shadow = new Shadow(660, -399);
    bubble= new Spray(900,700);
    nr = new NarrationBox("The crown prince jumped into the sea to save Simcheong.", 0, 0);
  }
  
  public void draw(){
    super.draw();
    
    player.play();
    player2.play();
    background(#398CC4);
    pushMatrix();
    scale(0.7);   
    image(wave, 0, 240);
    shadow.draw(30);
    if(count >4){
        bubble.draw(0.2);   
    }
    count++;
    popMatrix();
    nr.draw();
  }
}
