import ddf.minim.*;
class SeventhScene1 {
  PImage img;
  PFont font;
  Minim minim;
  AudioPlayer player;
  PApplet p;
  FirstSceneManage sceneManager;
  boolean audioFinished = false;  // Add this variable to track audio status

  SeventhScene1(PApplet p, FirstSceneManage sceneManager) {
    this.p = p;
    this.sceneManager = sceneManager;
    img = p.loadImage("300석얘기.png"); // Ensure this file is in the data folder
    font = p.createFont("Pretendard-Bold.ttf", 48);
    p.textFont(font);
    minim = new Minim(p);
  }

  void start() {
    player = minim.loadFile("#S3-1.mp3"); // Ensure this file is in the data folder
    if (player != null) {
      player.play();
    }
  }

  void draw() {
    p.background(255);
    p.image(img, 0, 0);
    p.fill(0);
    p.textSize(34);
    p.text("Sim Bong-sa told Sim Cheong about the suggestion he heard from the monk", 38, 799); // Replace with actual text

    // Check if the audio has finished playing
    if (player != null && !player.isPlaying() && !audioFinished) {
      audioFinished = true;
      sceneManager.switchToEighthScene();  // Switch to the next scene
    }
  }

  void stop() {
    if (player != null) {
      player.close();
    }
    minim.stop();
  }
}
