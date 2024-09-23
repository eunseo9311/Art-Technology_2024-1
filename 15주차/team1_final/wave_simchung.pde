import processing.sound.*;

public class WaveScene extends Scene{
  PImage bg;
  PImage ship;
  PImage wave1;
  PImage wave2;
  PImage wave3;
  PImage wave5;
  PImage wave4;

  float shipX; // ship 이미지의 x 좌표
  boolean shipVisible; // ship 이미지의 가시성 여부

  // 파도의 초기 y 좌표 및 이동 속도
  float wave1Y, wave2Y, wave3Y, wave4Y, wave5Y;
  float wave1Speed, wave2Speed, wave3Speed, wave5Speed;

  public WaveScene() {
    stopFrameCount = 80; 
    bg = loadImage("대지 1.png"); 
    wave1 = loadImage("파도1.png");
    wave2 = loadImage("파도2.png");
    wave3 = loadImage("파도3.png");
    wave5 = loadImage("파도5.png");
    ship = loadImage("코딩-배.png");
    wave4 = loadImage("파도4.png");
  
    shipX = 0;
    shipVisible = true;
  
    wave1Y = 220;
    wave2Y = 310;
    wave3Y = 310;
    wave5Y = 195;
    wave4Y = 139;
  
    wave1Speed = 0.5;
    wave2Speed = 0.3;
    wave3Speed = 0.6;
    wave5Speed = 0.5;
  }
  
  @Override //자동으로!
  void draw() {
    super.draw(); //부모객체의 draw를 사용하겠다 -> 자식객체에도 draw가 있으니까 구분을 해주기 위함이다.
    //draw는 함수니까 ()를 같이 적어줘야 한다.
    background(255);
    image(bg, 0, 0);

    wave1Y += wave1Speed;
    wave2Y += wave2Speed;
    wave3Y += wave3Speed;
    wave5Y += wave5Speed;

    image(wave1, 0, wave1Y);
    image(wave2, 0, wave2Y);
    image(wave3, 0, wave3Y);
    image(wave5, 0, wave5Y);
    image(wave4, 0, wave4Y);

    if (shipVisible) {
      image(ship, shipX, height / 2);
      shipX += 6;
      if (shipX > width) {
        shipVisible = false;
      }
    }
  }


  void stop() {
    // 필요한 경우 추가적인 작업을 여기에 추가할 수 있습니다.
  }
}
