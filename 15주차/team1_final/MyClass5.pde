import processing.sound.*;

class MyClass5 {
  PImage bg4, Zzol, speechBubble, bg, drum, king_ssim, thing, ssimbong1, ssimbong2, bg2, kneeBong, bong_say;
  PImage bg3, bg5, bg6, bg7, walk_ssim, sad_bong, ssim_say, ssim_say2, wbg;
  PFont pretendardBold;
  SoundFile sound1, sound2, fifthScene3, fifthScene4;

  Scene1 scene1;
  Scene2 scene2;
  Scene3 scene3;

  boolean scene1Finished = false;
  boolean scene2Finished = false;
  int sceneChangeTime;
  public MyClass5(PApplet p) {

    size(1280, 832);
    
    pretendardBold = createFont("Pretendard-Bold.ttf", 16);
    
    // 첫 번째 장면 리소스 로드
    bg4 = loadImage("bg4.png");
    Zzol = loadImage("Zzol.png");
    speechBubble = loadImage("speech2.png");
    sound1 = new SoundFile(p, "fifthScene1.mp3");

    // 두 번째 장면 리소스 로드
    bg = loadImage("bg_zzanci.png");
    drum = loadImage("drum.png");
    king_ssim = loadImage("king_ssim.png");
    thing = loadImage("thing.png");
    ssimbong1 = loadImage("ssimbong1.png");
    ssimbong2 = loadImage("ssimbong2.png");
    bg2 = loadImage("bg2.png");
    kneeBong = loadImage("kneeBong.png");
    bong_say = loadImage("speech2.png");
    sound2 = new SoundFile(p, "fifthScene2.mp3");

    // 세 번째 장면 리소스 로드
    bg3 = loadImage("bg3.png");
    bg5 = loadImage("bg5.png");
    bg6 = loadImage("bg6.png");
    bg7 = loadImage("bg7.png");
    wbg = loadImage("wbg.png");
    walk_ssim = loadImage("walk_ssim.png");
    sad_bong = loadImage("sad_bong.png");
    ssim_say = loadImage("speech2.png");
    ssim_say2 = loadImage("speech.png");
    fifthScene3 = new SoundFile(p, "fifthScene3.mp3");
    fifthScene4 = new SoundFile(p, "fifthScene4.mp3");

    // 각 장면 인스턴스 생성
    scene1 = new Scene1();
    scene2 = new Scene2();
    scene3 = new Scene3();

    // 첫 번째 장면 사운드 재생
    sound1.play();
  }

  void draw() {
    if (!scene1Finished) {
      scene1.display();
      if (scene1.isFinished()) {
        scene1Finished = true;
        sceneChangeTime = millis();
        sound1.stop();
        sound2.play();
      }
    } else if (!scene2Finished) {
      if (millis() > sceneChangeTime + 2000) {  // 2초 후에 Scene2로 전환
        scene2.display();
        if (scene2.isFinished()) {
          scene2Finished = true;
          sceneChangeTime = millis();
          sound2.stop();
        }
      }
    } else {
      if (millis() > sceneChangeTime + 2000) {  // 2초 후에 Scene3로 전환
        scene3.display();
      }
    }
  }

  class Scene1 {
    float ZzolY = 300;
    int dialogueStartTime;
    boolean dialogueStarted = false;
    String dialogue = "What happened to my father?\nOr did he open his eyes and \n go somewhere else?";
    boolean finished = false;

    Scene1() {
      dialogueStartTime = millis() + 2000;
    }

    void display() {
      background(bg4);
      image(Zzol, 430, ZzolY);

      if (ZzolY == 320) {
        ZzolY = 300;
      } else {
        ZzolY += 0.5;
      }

      if (millis() > dialogueStartTime) {
        dialogueStarted = true;
      }

      if (dialogueStarted) {
        drawSpeech(dialogue, 100, 70);
        if (millis() > dialogueStartTime + 5000) {  // 5초 후 Scene1 종료
          finished = true;
        }
      }
    }

    boolean isFinished() {
      return finished;
    }

    void drawSpeech(String message, float x, float y) {
      image(speechBubble, x + 0, y + 0);
      drawText(message, x - 150, y - 70);
    }

    void drawText(String message, float x, float y) {
      pushStyle();
      fill(0);
      textAlign(CENTER);
      textFont(pretendardBold);
      textSize(16);
      text(message, x + 310, y + 185);
      popStyle();
    }
  }

  class Scene2 {
    float ssimBongX = 300;
    int timeToChangeBackground;
    boolean backgroundChanged = false;
    boolean newImagesDisplayed = false;
    boolean finished = false;

    int firstDialogueMillis;
    String[] dialogues = {
      "I am a criminal\nwho sold my daughter to death.",
      "Please punish me severely."
    };
    boolean firstDialogueDisplayed = false;

    Scene2() {
    }

    void display() {
      if (!backgroundChanged) {
        background(bg);
      } else {
        background(bg2);
        if (millis() > timeToChangeBackground + 2000) {
          newImagesDisplayed = true;
          finished = true;
        }
      }

      if (firstDialogueDisplayed && millis() - firstDialogueMillis <= 3000) {
        drawSpeech(dialogues[0], 100, 70);
      } else if (firstDialogueDisplayed && millis() - firstDialogueMillis > 3000) {
        drawSpeech(dialogues[1], 100, 70);
      }

      if (!newImagesDisplayed) {
        image(drum, 630, 400);
        image(king_ssim, -130, 190);
        image(thing, 200, 240);
        image(ssimbong1, ssimBongX, 570);

        if (ssimBongX == 100) {
          ssimBongX -= 0;
        } else {
          ssimBongX -= 1;
        }
      } else {
        image(kneeBong, width / 2 - 150, 240);
      }

      if (!backgroundChanged && ssimBongX == 100) {
        backgroundChanged = true;
        firstDialogueMillis = millis();
        firstDialogueDisplayed = true;
      }
    }

    boolean isFinished() {
      return finished;
    }

    void drawSpeech(String message, float x, float y) {
      image(bong_say, x + 150, y + 100);
      drawText(message, x + 10, y + 40);
    }

    void drawText(String message, float x, float y) {
      pushStyle();
      fill(0);
      textAlign(CENTER);
      textFont(pretendardBold);
      textSize(16);
      text(message, x + 310, y + 185);
      popStyle();
    }
  }

  class Scene3 {
    float walkSsimX = -170;
    int firstDialogueMillis;
    String[] dialogues = {
      "This is definitely my father’s voice.",
      "Father, this is Cheong.\n Father’s daughter Cheongi!",
      "Are you really saying \nthis is my daughter Cheong?\n You mean you’re really alive?"
    };
    boolean firstDialogueDisplayed = false;
    int secondDialogueMillis;
    boolean secondDialogueDisplayed = false;
    float alpha = 0;
    boolean finished = false;
    boolean fifthScene3Played = false;  // fifthScene3 재생 여부
    boolean fifthScene4Played = false;  // fifthScene4 재생 여부

    Scene3() {
    }
    void keyPressed() {
      if (key == CODED) {
        if (keyCode == RIGHT) {
          walkSsimX += 10;
        } else if (keyCode == LEFT) {
          walkSsimX -= 2;
        }
      }
    }
    void display() {
      if (!firstDialogueDisplayed) {
        image(bg3, 0, 0, width, height);
        image(walk_ssim, walkSsimX, 300);
        image(sad_bong, width / 2 + 50, 330);
      }

      if (walkSsimX >= width / 2 - 100 && !firstDialogueDisplayed) {
        firstDialogueMillis = millis();
        firstDialogueDisplayed = true;
      }

      if (firstDialogueDisplayed && millis() - firstDialogueMillis <= 3000) {
        drawSpeech1(dialogues[0], 100, 70);
      } else if (firstDialogueDisplayed && millis() - firstDialogueMillis > 3000 && millis() - firstDialogueMillis <= 6000) {
        drawSpeech1(dialogues[1], 100, 70);
      } else if (firstDialogueDisplayed && millis() - firstDialogueMillis > 6000 && !secondDialogueDisplayed) {
        secondDialogueMillis = millis();
        secondDialogueDisplayed = true;
        drawSpeech2(dialogues[2], 400, 200);
      }
     

      if (secondDialogueDisplayed) {
        if (millis() - secondDialogueMillis <= 10000) {
          alpha = map(millis() - secondDialogueMillis, 4000, 10000, 0, 255);
          tint(255, alpha);
          image(wbg, 0, 0, width, height);
          noTint();

          if (millis() - secondDialogueMillis >= 4000 && millis() - secondDialogueMillis <= 15000) {
            if (!fifthScene3Played) {
              fifthScene3.play();
              fifthScene3Played = true;
            }
          }
        } else if (millis() - secondDialogueMillis <= 18000) {
          alpha = map(millis() - secondDialogueMillis, 10000, 22000, 255, 0);
          tint(255, 255 - alpha);
          image(bg6, 0, 0, width, height);
          noTint();
        } else {
          alpha = map(millis() - secondDialogueMillis, 22000, 30000, 0, 255);
          tint(255, alpha);
          image(bg7, 0, 0, width, height);
          noTint();

          if (!fifthScene4Played) {
            fifthScene4.play();
            fifthScene4Played = true;
            finished = true;
          }
        }
      }
    }

    boolean isFinished() {
      return finished;
    }

    void drawSpeech1(String message, float x, float y) {
      image(ssim_say, x + 150, y + 100);
      drawText1(message, x + 10, y + 30);
    }

    void drawText1(String message, float x, float y) {
      pushStyle();
      fill(0);
      textAlign(CENTER);
      textFont(pretendardBold);
      textSize(16);
      text(message, x + 310, y + 185);
            popStyle();

    }

    void drawSpeech2(String message, float x, float y) {
      image(ssim_say2, x + 480, y - 50);
      drawText2(message, x + 340, y - 130);
    }

    void drawText2(String message, float x, float y) {
      pushStyle();
      fill(0);
      textAlign(CENTER);
      textFont(pretendardBold);
      textSize(16);
      text(message, x + 310, y + 185);
            popStyle();

    }
  }
  void keyPressed(){
    scene3.keyPressed();
  }
  
}
