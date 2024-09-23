// 각 클래스의 코드를 정의한 파일들을 만들어주세요.
import processing.sound.*;
import gifAnimation.*;

// MyClass1.pde
class MyClass1 {

  PImage bg;
  PImage momImage;
  PImage fishImage;
  PImage fishImage2;
  PImage squidImage;

  int interval = 3000;
  int blinkDuration = 1500;
  int lastBlink = 0;
  float blinkCount = 0;

  float fishesX = 100;
  float fishesY = 50;

  boolean transitionToSecondPart = false;
  int transitionStartTime;

  PFont pretendardBold; // 폰트 선언

  SoundFile firstSceneAudio;  // Declare SoundFile object
  boolean hasPlayedFirstSceneAudio = false;  // Track if the audio has been played


  public MyClass1(PApplet p) {
    size(1280, 832);
    // 이미지 파일 로드는 setup 함수 내부에서 이루어져야 합니다.
    bg = loadImage("sea_background.png");
    momImage = loadImage("mom2.png");
    fishImage = loadImage("fishes.png");
    fishImage2 = loadImage("fish2.png");
    squidImage = loadImage("minjae.png");

    // Pretendard Bold 폰트를 불러옵니다.
    pretendardBold = createFont("Pretendard-Bold.ttf", 16);

    // Initialize and load the audio file
    firstSceneAudio = new SoundFile(p, "firstScene.mp3");
  }


  void draw() {
    if (!transitionToSecondPart) {
      drawFirstPart();
    } else {
      drawSecondPart();
    }
  }

  void drawFirstPart() {
    background(0);
    int elapsedTime = millis() - lastBlink;

    if (elapsedTime > interval + blinkDuration) {
      lastBlink = millis();
      blinkCount++;
    }

    float progress;
    if (elapsedTime < interval) {
      progress = 0;
    } else if (elapsedTime < interval + blinkDuration / 2) {
      progress = map(elapsedTime, interval, interval + blinkDuration / 2, 0, 1);
    } else {
      progress = map(elapsedTime, interval + blinkDuration / 2, interval + blinkDuration, 1, 0);
    }

    drawEye(width / 2, height / 2, 50, progress);

    if (fishesX <= -200) {
      fishesX = 500;
    }

    fishesX -= 0.5;


    if (blinkCount >= 4.5) {
      fishImage = momImage;
      fishImage2 = momImage;
      squidImage = momImage;
      fishesX = 50;
      fishesY = 0;
      if (transitionStartTime == 0) {
        transitionStartTime = millis();
      }
    }

    if (transitionStartTime != 0 && millis() - transitionStartTime > 3000) {
      setupSecondPart(); // 두 번째 코드의 setup 함수 호출
      transitionToSecondPart = true;
    }

  }


  void drawEye(float x, float y, float size, float progress) {
    float eyeHeightUpper = lerp(size * 6, 0, progress);
    float eyeHeightLower = lerp(size * 3.5, 0, progress);
    eyeHeightUpper = max(eyeHeightUpper, 0);
    eyeHeightLower = max(eyeHeightLower, 0);

    if (progress < 1) {
      PImage maskedImg = createMaskedImage(bg, fishImage,fishImage2, squidImage, (int)(size * 12), (int)(eyeHeightUpper + eyeHeightLower), eyeHeightUpper, eyeHeightLower);
      image(maskedImg, x - (size * 12) / 2, y - (eyeHeightUpper + eyeHeightLower) / 2);
    }
  }

  PImage createMaskedImage(PImage bg, PImage fishImage, PImage fishImage2,PImage squidImage, int w, int h, float eyeHeightUpper, float eyeHeightLower) {
    w = max(w, 1);
    h = max(h, 1);

    PGraphics pg = createGraphics(w, h);
    pg.beginDraw();
    pg.image(bg, 0, 0, w, h);


    pg.image(fishImage, fishesX, fishesY);
    pg.image(fishImage2, fishesX + 450, fishesY+100);
    pg.image(squidImage, fishesX + 550, fishesY+60);



    pg.endDraw();

    PGraphics mask = createGraphics(w, h);
    mask.beginDraw();
    mask.background(0);
    mask.fill(255);
    mask.beginShape();
    mask.vertex(0, h / 2);
    mask.bezierVertex(0, h / 2 - eyeHeightUpper, w, h / 2 - eyeHeightUpper, w, h / 2);
    mask.bezierVertex(w, h / 2 + eyeHeightLower, 0, h / 2 + eyeHeightLower, 0, h / 2);
    mask.endShape(CLOSE);
    mask.endDraw();

    PImage maskedImg = pg.get();
    maskedImg.mask(mask.get());
    return maskedImg;
  }

  // 두 번째 코드 관련 변수와 함수 선언
  PImage momSsim, bg2, mom, ssim, fish, fish2, squid, speechBubbleMom, speechBubbleSsim;
  float fX = 800;
  float fX2 = 150;
  float sX = 400;
  boolean showMomSsim = true;
  boolean hasSwitched = false;
  int startTime;
  ArrayList<Character> characters = new ArrayList<>();
  int nextSpeechTime = 0;
  int speechInterval = 5000;
  int currentDialogueIndex = 0;

  void setupSecondPart() {
    mom = loadImage("mom.png");
    bg2 = loadImage("sea_background_2.png");
    ssim = loadImage("ssim.png");
    momSsim = loadImage("mom_ssim.png");
    fish = loadImage("fish.png");
    fish2 = loadImage("fish2.png");
    squid = loadImage("minjae.png");
    speechBubbleMom = loadImage("speech2.png");
    speechBubbleSsim = loadImage("speech.png");

    startTime = millis();

    characters.add(new Character(width / 2 - 80, 440, "Mom", mom, speechBubbleMom, -150, -380));
    characters.add(new Character(width / 2 + 120, 490, "SSIM", ssim, speechBubbleSsim, 150, -380));
  }

  void drawSecondPart() {
    background(bg2);

    if (!hasSwitched && millis() - startTime >= 5000) {
      showMomSsim = !showMomSsim;
      hasSwitched = true;
    }

    if (showMomSsim) {
      image(momSsim, width / 2 - 100, 250);
      if (!hasPlayedFirstSceneAudio) {
        firstSceneAudio.play();
        hasPlayedFirstSceneAudio = true;  // Ensure the audio is only played once
      }
    } else {
      for (Character character : characters) {
        character.display();
      }

      if (millis() >= nextSpeechTime) {
        nextDialogue();
        nextSpeechTime = millis() + speechInterval;
      }
    }

    image(fish, fX, 100);
    image(fish2, fX2, 120);
    image(squid, sX, 60);

    fX -= 0.5;
    fX2 -= 0.6;
    sX -= 0.2;

    if (fX <= -300) {
      fX = width;
    }

    if (fX2 <= -220) {
      fX2 = width;
    }

    if (sX <= -50) {
      sX = width;
    }

  }

  void mouseClicked() {
    if (transitionToSecondPart) {
      boolean clickedCharacter = false;
      for (Character character : characters) {
        if (character.isClicked(mouseX, mouseY)) {
          nextDialogue();
          clickedCharacter = true;
        }
      }

      if (!clickedCharacter) {
        for (Character character : characters) {
          character.stopSpeaking();
        }
      }
    }
  }

  void nextDialogue() {
    if (currentDialogueIndex < characters.size() * 3 - 1) {
      Character currentCharacter = characters.get(currentDialogueIndex % 2);
      currentCharacter.nextSpeech(currentDialogueIndex / 2);
      currentDialogueIndex++;
    } else {
      for (Character character : characters) {
        character.stopSpeaking();
      }
      currentDialogueIndex = 0;
    }
  }

  class Character {
    float x, y;
    String name;
    String[] speeches;
    int currentSpeechIndex = 0;
    float bubbleOpacity = 0;
    boolean speaking = false;
    PImage img;
    PImage bubbleImg;
    float bubbleOffsetX;
    float bubbleOffsetY;

    Character(float x, float y, String name, PImage img, PImage bubbleImg, float bubbleOffsetX, float bubbleOffsetY) {
      this.x = x;
      this.y = y;
      this.name = name;
      if (name.equals("Mom")) {
        this.speeches = new String[] {
                "Cheong, can you hear me",

                "My lovely daughter Cheong // I missed you too",

                "It's not the right time yet, Cheong. // Go up on that lotus flower and // take good care of your father. // We'll meet again next time",
        };
      } else {
        this.speeches = new String[] {
                "Mother! Have you been well all this time! // I missed you so much",
                "Does this mean I can spend time // with you from now on? // Please say yes",
        };
      }
      this.img = img;
      this.bubbleImg = bubbleImg;
      this.bubbleOffsetX = bubbleOffsetX;
      this.bubbleOffsetY = bubbleOffsetY;
    }

    void display() {
      drawCharacter(x, y);
      if (speaking) {
        bubbleOpacity = min(bubbleOpacity + 5, 255);
        drawBubble(x, y - img.height / 2, bubbleOpacity, bubbleOffsetX, bubbleOffsetY);
      }
    }

    void nextSpeech(int index) {
      if (index < speeches.length) {
        currentSpeechIndex = index;
        speaking = true;
        bubbleOpacity = 0;
      } else {
        stopSpeaking();
      }
    }

    void stopSpeaking() {
      if (speaking) {
        speaking = false;
        bubbleOpacity = 0;
      }
    }

    boolean isClicked(float mx, float my) {
      float d = dist(mx, my, x, y);
      return (d < 50);
    }

    void drawCharacter(float x, float y) {
      image(img, x - img.width / 2, y - img.height / 2);
    }
    void drawBubble(float x, float y, float opacity, float offsetX, float offsetY) {
      float bubbleX = x - bubbleImg.width / 2 + offsetX;
      float bubbleY = y + img.height / 2 + offsetY;
      tint(255, opacity);
      image(bubbleImg, bubbleX, bubbleY);
      noTint();

      fill(0, opacity);
      textAlign(CENTER, CENTER);
      textSize(10);  // Adjust text size as needed

      // 프리텐다드 폰트 적용
      textFont(pretendardBold);

      String[] lines = speeches[currentSpeechIndex].split(" // ");
      for (int i = 0; i < lines.length; i++) {
        text(lines[i], bubbleX + bubbleImg.width / 2, bubbleY + bubbleImg.height / 2 + i * 18);  // Adjust line height as needed
      }
    }
  }
}
