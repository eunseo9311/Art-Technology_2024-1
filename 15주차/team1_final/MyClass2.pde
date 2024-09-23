// MyClass2.pde
class MyClass2 {

  PImage bg1, bg2, bg3, bg4, img, Zzol, speechBubble, open_lotus;
  PFont pretendardBold;
  SoundFile sound;
  float flowerY;
  float speed = 2.0;
  boolean drawFlower = true;
  boolean drawFirstBG = true;
  boolean drawSecondBG = false;
  boolean drawThirdBG = false;
  boolean drawFourthBG = false;
  float stopHeight;
  int dialogueStartTime;
  boolean dialogueStarted = false;
  boolean soundPlayed = false;
  int soundDelay = 2000; // 음성 재생을 2초 후로 지연

  PImage[] speechImages = new PImage[3]; // 대화 이미지를 저장할 배열
  String[] dialogues = new String[3]; // 대화 내용을 저장할 배열
  int dialogueDuration = 700; // 각 대화가 나타나는 시간 (밀리초)
  int[] dialogueStartTimes = new int[3]; // 각 대화가 시작되는 시간을 저장할 배열
  int currentDialogueIndex = 0; // 현재 대화 인덱스
  int lastDialogueTime = 0; // 마지막 대화 시간
  float openLotusYOffset = -95; // y-offset for open_lotus image
  float openLotusScale = 0.5; // Scale factor for open_lotus image


  public MyClass2(PApplet p) {
    size(1280, 832);
    bg1 = loadImage("Group 45.png");
    bg2 = loadImage("ship.png");
    bg3 = loadImage("ship_surprised.png");
    img = loadImage("flower.png");
    speechBubble = loadImage("speech2.png");
    open_lotus = loadImage("open_lotus.png");
    pretendardBold = createFont("Pretendard-Bold.ttf", 16);
    sound = new SoundFile(p, "secondScene.mp3");

    flowerY = height;
    stopHeight = height / 1.8;
    dialogueStartTime = millis() + 5000;

    // 대화 이미지 및 내용 초기화
    speechImages[0] = loadImage("speech2.png");
    speechImages[1] = loadImage("speech2.png");
    speechImages[2] = loadImage("speech2.png");

    dialogues[0] = "Hey guys, look at that! \n What is that? Why is the lotus there?";
    dialogues[1] = "I think such a pretty lotus flower \n will have a positive effect on our luck.";
    dialogues[2] = "This lotus is like a given from heaven, \n so let’s offer it to the king.";

    // 대화 시작 시간 설정
    for (int i = 0; i < 3; i++) {
      dialogueStartTimes[i] = dialogueStartTime + (i * dialogueDuration);
    }
  }

  void draw() {
    if (drawFirstBG) {
      background(bg1);

      if (drawFlower) {
        image(img, width / 2 - 125, flowerY);

        if (flowerY > -img.height) {
          flowerY -= speed;
        } else {
          drawFlower = false;
        }
      }

      if (!drawFlower && flowerY <= -img.height) {
        drawFirstBG = false;
        drawSecondBG = true;
        flowerY = height;
        drawFlower = true;
      }
    } else if (drawSecondBG) {
      background(bg2);

      if (drawFlower) {
        image(img, 980, flowerY);

        if (flowerY > stopHeight) {
          flowerY -= speed;
        } else {
          drawFlower = false;
          drawSecondBG = false;
          drawThirdBG = true;
        }
      }
    } else if (drawThirdBG) {
      background(bg3);

      drawThirdBG = false;
      drawFourthBG = true;
    } else if (drawFourthBG) {

      // 일정 시간이 경과하면 음성을 재생
      if (millis() > dialogueStartTime + soundDelay && !soundPlayed) {
        sound.play();
        soundPlayed = true;
      }

      // draw 함수 내 대사 출력 주기 조정
      if (millis() - lastDialogueTime > 2400 && currentDialogueIndex < 3) {
        drawSpeech(speechImages[currentDialogueIndex], dialogues[currentDialogueIndex], 100, 70);
        lastDialogueTime = millis();
        currentDialogueIndex++;
      }

      // Draw the flower and handle hover effect
      float flowerX = 970;
      boolean isMouseOverFlower = mouseX > flowerX && mouseX < flowerX + img.width && mouseY > stopHeight && mouseY < stopHeight + img.height;

      if (flowerY <= stopHeight) {
        if (isMouseOverFlower) {
          // Draw open_lotus image with scale and adjusted position
          image(open_lotus, flowerX - 40, flowerY + 57, open_lotus.width * openLotusScale, open_lotus.height * openLotusScale);
        } else {
          // Draw the original flower image
          image(img, flowerX, stopHeight+30);
        }
      }
    }
  }

  void drawSpeech(PImage image, String message, float x, float y) {
    image(speechBubble, x +150, y + 170);
    drawText(message, x + 10, y + 110);
  }

  void drawText(String message, float x, float y) {
    fill(0);
    textAlign(CENTER);
    textFont(pretendardBold);
    textSize(16);
    text(message, x + 310, y + 185);
  }
}
