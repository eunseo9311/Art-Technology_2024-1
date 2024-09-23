
import processing.sound.*;
SoundFile mySound;

public class FallScene extends Scene { //호출과 정의... 둘은 다르다.
  
  PImage backgroundImage;
  PImage characterImage;
  PImage overlayImage; // 추가할 이미지 변수
  float characterX, characterY;
  float velocityX = 15;
  float velocityY = -25; // y축 초기 속도 조정
  float gravity = 5.0; // 중력 값을 더 증가시켜 떨어지는 속도 증가

  // overlay 이미지의 크기를 조정하기 위한 변수
  float overlayWidth = 1000;
  float overlayHeight = 500;

  public FallScene(PApplet pApplet) { //클래스가 대문자라서 생성자도 대문자, 클래스 == 생성자이름.
    stopFrameCount = 80; 
    size(1280, 832);
    backgroundImage = loadImage("바다 배경 옆모습.png");
    characterImage = loadImage("심청이 뒷모습.png");
    overlayImage = loadImage("Vector (1).png"); // 추가할 이미지 로드
    characterX = 600;
    characterY = 250;

    mySound = new SoundFile(pApplet, "물에 풍덩 빠지는 소리.mp3");
    mySound.cue(5000); // 5000 밀리초 지점부터 사운드 재생
    mySound.play(); // 사운드 재생
    mySound.cue(8);

  }

  @Override
  void draw() {
    super.draw();
    // 배경 그리기
    image(backgroundImage, 0, 0, width, height);

    // 포물선 운동 계산
    characterX += velocityX;
    characterY += velocityY;
    velocityY += gravity; // 중력 적용

    // 캐릭터 이미지 그리기
    image(characterImage, characterX, characterY, 150, 300);

    // 추가할 이미지 맨 위에 그리기 (사용자가 지정한 크기로)
    image(overlayImage, 0, 500, 1280, 400);
  }
}
