import processing.sound.*;
import gifAnimation.*;

class MyClass3 {
  SoundFile audio1;
  SoundFile audio2;
  SoundFile audio3;

  PImage image1;
  PImage image2;
  int startTime;
  boolean showFirstImage = true;  // 첫 번째 이미지를 표시할지 여부
  PImage shinha1;
  PImage shinha2;

  PImage[] images = new PImage[46];  // 46개의 이미지를 저장할 배열
  GifMaker gifExport;
  int currentImage = 0;  // 현재 표시되는 이미지의 인덱스
  int frameCount = 0;
  int framesPerImage = 1; // 각 이미지에 대한 총 프레임 수 (1초 동안 이미지 표시)
  int totalFrames; // 총 프레임 수

  PImage bg;
  boolean gifFinished = false;

  int audio1EndTime;
  int audio2StartTime;
  int audio2EndTime;
  int audio3StartTime;
  int audio3EndTime;

  boolean audio2Played = false; // 두 번째 오디오가 재생되었는지 여부
  boolean audio3Played = false; // 세 번째 오디오가 재생되었는지 여부

  PImage lastImage; // 마지막 이미지를 저장할 변수
  PImage speechBubble1, speechBubble2; // 말풍선 이미지
  PFont pretendardBold; // 폰트 선언

  int dialogueStartTime1, dialogueStartTime2; // 대사 시작 시간 기록
  boolean dialogueStarted1 = false, dialogueStarted2 = false; // 대사가 시작되었는지 여부



  public MyClass3(PApplet p) {
    size(1280, 832); // 캔버스 크기 설정
    bg = loadImage("bgSam.png"); // 배경 이미지 로드

    // Sound 라이브러리 초기화
    audio1 = new SoundFile(p, "audio1.mp3");
    audio2 = new SoundFile(p, "audio2.mp3");
    audio3 = new SoundFile(p, "audio3.mp3");

    // GifMaker 초기화
    gifExport = new GifMaker(p, "animation.gif");
    gifExport.setRepeat(0); // 반복 설정 (0 = 무한 반복)
    gifExport.setQuality(10); // 품질 설정 (1-100)
    gifExport.setDelay(1000 / 1); // 프레임 딜레이 설정 (1000ms = 1초)

    // 이미지 로드
    for (int i = 0; i < images.length; i++) {
      images[i] = loadImage("Group " + (219 + i) + ".png"); // 각 이미지 로드
      if (images[i] == null) {
        println("Could not load image: Group " + (219 + i) + ".png");
      }
    }
    if (bg == null) {
      println("Could not load background image");
    }

    totalFrames = images.length * framesPerImage;
    image1 = loadImage("image1.png"); // 첫 번째 이미지 로드
    image2 = loadImage("image2.png"); // 두 번째 이미지 로드
    if (image1 == null) {
      println("Could not load image1.png");
    }
    if (image2 == null) {
      println("Could not load image2.png");
    }
    shinha1 = loadImage("shinha1.png"); // 첫 번째 이미지 로드
    shinha2 = loadImage("shinha2.png"); // 두 번째 이미지 로드
    if (shinha1 == null) {
      println("Could not load shinha1.png");
    }
    if (shinha2 == null) {
      println("Could not load shinha2.png");
    }

    lastImage = loadImage("Group 264.png"); // 마지막 이미지 로드
    if (lastImage == null) {
      println("Could not load Group 264.png");
    }

    speechBubble1 = loadImage("speech.png"); // 첫 번째 말풍선 이미지 로드
    speechBubble2 = loadImage("speech2.png"); // 두 번째 말풍선 이미지 로드
    pretendardBold = createFont("Pretendard-Bold.ttf", 16); // 폰트 로드

    startTime = millis(); // 현재 시간을 저장

    // 첫 번째 오디오 재생 시작
    audio1.play();
    audio1EndTime = (int)(audio1.duration() * 1000); // 첫 번째 오디오 재생 시간 (밀리초 단위)
    audio2StartTime = audio1EndTime + 3000; // 첫 번째 오디오 끝난 후 3초 후
    audio2EndTime = audio2StartTime + (int)(audio2.duration() * 1000); // 두 번째 오디오 재생 시간 (밀리초 단위)
    audio3StartTime = audio2EndTime + 2000; // 두 번째 오디오 끝난 후 5초 후
    audio3EndTime = audio3StartTime + (int)(audio3.duration() * 1000); // 세 번째 오디오 재생 시간 (밀리초 단위)

    dialogueStartTime1 = audio1EndTime + 10000; // 첫 번째 대사 시작 시간 (첫 번째 오디오 끝난 후 1초 후)
    dialogueStartTime2 = audio2EndTime + 10000; // 두 번째 대사 시작 시간 (두 번째 오디오 끝난 후 1초 후)
  }

  String[] dialogues = { 
    "um..",
    "I don’t know where it came from, \n but it is a very pretty lotus flower. \n who are you?"
  };
  int dialogueIndex = 0; // 현재 출력 중인 대사 인덱스

  void draw() {
    background(bg); // 배경을 설정

    int elapsedTime = millis() - startTime;

    if (elapsedTime >= 0) {
      if (!gifFinished) {
        image(images[currentImage], 750, 430, 313, 277); // 현재 이미지를 표시
        gifExport.addFrame(); // 현재 프레임을 GIF에 추가

        // 다음 이미지로 전환
        frameCount++;
        if (frameCount % framesPerImage == 0) {
          currentImage = (currentImage + 1) % images.length;
        }

        if (currentImage == images.length - 1) {
          // 마지막 이미지에 도달했을 때 gifFinished를 true로 설정
          gifFinished = true;
          gifExport.finish();
        }
      } else {
        // GIF가 완료되었을 때 마지막 이미지를 표시
        image(lastImage, 750, 430, 313, 277);
      }

      // 이미지를 표시
      if (showFirstImage) {
        image(image1, 200, 300); // 첫 번째 이미지를 표시
        if (elapsedTime > 3000) { // 3초가 지나면
          showFirstImage = false; // 두 번째 이미지로 전환
        }
      } else {
        image(image2, 200, 300); // 두 번째 이미지를 표시
      }

      if (showFirstImage) {
        image(shinha1, 80, 250); // 첫 번째 이미지를 표시
        if (elapsedTime > 3000) { // 3초가 지나면
          showFirstImage = false; // 두 번째 이미지로 전환
        }
      } else {
        image(shinha2, 80, 250); // 두 번째 이미지를 표시
      }

      // 대사 표시
      if (millis() > dialogueStartTime1 && dialogueIndex == 0 && !dialogueStarted1) {
        drawSpeech(dialogues[dialogueIndex], 350, 200, speechBubble1);
        if (millis() > dialogueStartTime1 + 5000) { // 5초 후
          dialogueIndex = 1; // 대사 교체
          dialogueStarted1 = true; // 대사가 시작됨을 표시
        }
      } else if (dialogueIndex == 1) {
        drawSpeech(dialogues[dialogueIndex], 350, 200, speechBubble1);
      }
    }

    // 오디오 재생 관리
    if (elapsedTime >= audio2StartTime && !audio2Played) {
      audio2.play();
      audio2Played = true;
    }

    if (elapsedTime >= audio3StartTime && !audio3Played) {
      audio3.play();
      audio3Played = true;
    }
  }

  void drawSpeech(String message, float x, float y, PImage speechBubble) {
    image(speechBubble, x, y); // 말풍선 이미지 표시
    fill(0); // 검은색 텍스트
    textAlign(CENTER); // 텍스트 정렬 설정
    textFont(pretendardBold); // 폰트 설정
    textSize(16); // 텍스트 크기 설정
    text(message, x + speechBubble.width / 2, y + speechBubble.height / 2); // 텍스트 그리기
  }
}
