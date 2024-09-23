public class InterScene extends Scene {


  PImage img, light1, light2;  // 이미지를 저장할 변수
  int x1, y1;
  int x2, y2;
  float alpha1, alpha2;
  float light1Width, light1Height;
  float light2Width, light2Height;
  int scene;

  PImage img1, img2, ribbon, backgroundImg;
  PImage img3, img4;
  float ribbonX, ribbonY;
  float initialRibbonX;
  float img1X, img1Y, img2X, img2Y;
  float img3X, img3Y, img4X, img4Y;
  float img1Scale = 0.1285; // Scale factor for img1 (no scaling)
  float img2Scale = 0.1285; // Scale factor for img2 (50% scaling)
  float img3Scale = 0.1285;
  float img4Scale = 0.1285;
  float backgroundScale = 0.185; // Scale factor for background image (50% scaling)

  public InterScene() {
    // 배경 이미지와 반짝이는 이미지를 로드합니다.
    img = loadImage("1 (1).png");
    light1 = loadImage("무제-25.png");
    light2 = loadImage("무제-25.png");

    x1 = width / 3 + 90-10;
    y1 = height / 2 - 20-30;

    x2 = 2 * width / 3 -120-10;
    y2 = height / 2 + 330-10;

    light1Width = 100; // 첫 번째 이미지의 너비
    light1Height = 100; // 첫 번째 이미지의 높이
    light2Width = 100; // 두 번째 이미지의 너비
    light2Height = 100; // 두 번째 이미지의 높이

    // Scene 1 setup
    img1 = loadImage("머리묶 댕기푼 심청이_대지 1.png");
    img2 = loadImage("머리푼 댕기푼 심청이_대지 1.png");
    ribbon = loadImage("심청이 댕기_대지 1.png");

    ribbon.resize(ribbon.width / 4, ribbon.height / 4);

    ribbonX = width / 4 - ribbon.width / 2;
    ribbonY = height / 1.15 - ribbon.height / 2;

    // Scene 2 setup
    img3 = loadImage("꽃신 한 짝.png");
    img4 = loadImage("꽃신 한 짝2.png");
    backgroundImg = loadImage("버선발심청_대지 1.png");

    img3X = 450 + 10;
    img3Y = 400 - 30;
    img4X = 660 + 60;
    img4Y = 400 - 48;

    scene = 0;
  }

  void draw() {

    showMainScene();
  }

  void showMainScene() {
    background(0); // 배경을 검정으로 초기화합니다.
    image(img, 100, 0-40, width-200, height+50); // 배경 이미지를 창 크기에 맞게 조정합니다.

    // 알파 값을 시간에 따라 변하게 함 (sin 파형을 사용)
    alpha1 = 127 + 127 * sin(TWO_PI * frameCount / 30);
    alpha2 = 127 + 127 * cos(TWO_PI * frameCount / 30);

    // 첫 번째 반짝이는 이미지 그리기
    tint(255, alpha1);
    image(light1, x1 - light1Width / 2, y1 - light1Height / 2, light1Width, light1Height);

    // 두 번째 반짝이는 이미지 그리기
    tint(255, alpha2);
    image(light2, x2 - light2Width / 2, y2 - light2Height / 2, light2Width, light2Height);

    noTint(); // 이후 그려지는 이미지에 영향을 주지 않도록 tint 설정 해제
  }


  void mousePressed() {
    print("Pressed");
    if (mouseX > x1 - light1Width / 2 && mouseX < x1 + light1Width / 2 &&
      mouseY > y1 - light1Height / 2 && mouseY < y1 + light1Height / 2) {
      scene = 1; // 첫 번째 이미지 클릭 시 첫 번째 장면으로 이동
      print("change1");
    } else if (mouseX > x2 - light2Width / 2 && mouseX < x2 + light2Width / 2 &&
      mouseY > y2 - light2Height / 2 && mouseY < y2 + light2Height / 2) {
      scene = 2; // 두 번째 이미지 클릭 시 두 번째 장면으로 이동
    }
  }

  void keyPressed() {
    if (key == 'b' || key == 'B') {
      scene = 0; // 'B' 키를 누르면 메인 장면으로 돌아가기
    }
  }
  boolean isFinished() {
    return scene != 0;
    //return currentFrameCount >= stopFrameCount;
  }
  
  boolean isHair(){
    if (scene == 1) {
      return true;
    } else {
      return false;
    }
  }
  

}

//
