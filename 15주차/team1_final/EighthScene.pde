import ddf.minim.*;

class EightScene1 {
  PImage img;
  PFont font;
  Minim minim;
  AudioPlayer player1;
  AudioPlayer player2;
  PApplet p;
  FirstSceneManage sceneManager;

  EightScene1(PApplet p, FirstSceneManage sceneManager) {
    this.p = p;
    this.sceneManager = sceneManager;
    img = p.loadImage("배타러-가는-심청.png"); // Ensure this file is in the data folder
    font = p.createFont("Pretendard-Bold.ttf", 48);
    p.textFont(font);
    minim = new Minim(p);
  }

  void start() {
    player1 = minim.loadFile("murmur.WAV");
    player2 = minim.loadFile("#S3-2.mp3"); // Ensure this file is in the data folder
    if (player1 != null) {
      player1.play();
      player1.setGain(-10); // Reduce the volume of player1 by 20 dB
    }
    if (player2 != null) {
      player2.play();
    }
  }

  void draw() {
    p.background(255);
    p.image(img, 0, 0);
    p.fill(0);
    p.textSize(38);
    p.text("Simcheong decided to become a sacrifice to save 300 bags of rice", 33, 782); // Replace with actual text
    
    if (!player2.isPlaying()) {
      sceneManager.switchToNineScene();
    }
  }

  void stop() {
    if (player1 != null) {
      player1.close();
    }
    if (player2 != null) {
      player2.close();
    }
    minim.stop();
  }
}
