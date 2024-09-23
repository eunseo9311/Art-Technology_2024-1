import ddf.minim.*;
class FirstScene1 {
  PImage img;
  PFont font;
  Minim minim;
  AudioPlayer player;
  PApplet p;
  FirstSceneManage sceneManager;

  FirstScene1
(PApplet p, FirstSceneManage sceneManager) {
    this.p = p;
    this.sceneManager = sceneManager;
    img = p.loadImage("첫씬.png");
    font = p.createFont("Pretendard-Bold.ttf", 48);
    p.textFont(font);
    minim = new Minim(p);
  }

  void start() {
    player = minim.loadFile("#S1-1.mp3");
    player.play();
  }

  void draw() {
    p.background(255);
    p.image(img, 0, 0);
    
    p.fill(0); 
    p.textSize(45); 
    p.text("Once upon a time, Simcheong, who had", 187, 741);
    p.text("a blind father in a poor family, was born", 190, 802);

    if (!player.isPlaying()) {
      sceneManager.switchToSecondScene();
    }
  }

  void stop() {
    if (player != null) {
      player.close();
    }
    minim.stop();
  }
}
