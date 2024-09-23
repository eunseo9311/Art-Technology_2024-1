class TwoEndingScene extends Scene3 {
  PImage ending;
    
  Minim minim;
  AudioPlayer player; 
  
  NarrationBox nr;
  public TwoEndingScene(PApplet p){
    minim = new Minim(p);
    nr = new NarrationBox("With the help of the crown prince, \nsSimcheong was reunited with her father and lived happily ever after",0,0);
    ending = loadImage("ending.png");
    player = minim.loadFile("ElevenLabs_2024-06-09T19_28_56_Dorothy_pre_s50_sb75_se0_b_m2.mp3");
  }
  void draw(){
    image(ending, 0, 0);
    player.play();
    nr.draw();
  }

}
