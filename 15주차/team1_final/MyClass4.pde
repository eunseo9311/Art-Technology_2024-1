import processing.sound.*;

class MyClass4 {
  SoundFile narration1;
  SoundFile narration2;

  PImage kingdom_1; 
  PImage normal_simcheong;
  PImage king_1;
  PImage kingdom_background_1;

  float alpha2 = 0;
  float king_1Scale = 1.0;
  float bgScale = 1.0;
  float normal_simcheongX;
  float normal_simcheongY;

  boolean enlarged = false;
  boolean king_1AnimationDone = false;
  float targetAlpha = 255;

  PImage kingdom_2;
  PImage cry_simcheong_2;
  PImage king_2;
  PImage king_background_2;

  float cry_simcheongX_2;
  float cry_simcheongY_2;
  float cry_simcheongScale_2 = 2.0;

  float kingX_2;
  float kingY_2;
  float kingScale_2 = 2.0;

  boolean secondScene = false;
  int timerStart = 0;

  public MyClass4(PApplet p) {

    size(1280, 832);

    narration1 = new SoundFile(p, "fourthScene1.mp3");
    narration2 = new SoundFile(p, "fourthScene2.mp3");

    narration1.play();

    kingdom_1 = loadImage("시스템 설정.png"); 
    normal_simcheong = loadImage("Frame 51.png");
    king_1 = loadImage("king.png");
    kingdom_background_1 = loadImage("배경 이미지 파일.png");

    float chairX = 468;
    float chairY = 300;

    normal_simcheongX = chairX;
    normal_simcheongY = chairY;

    kingdom_1.resize(width, height);

    kingdom_2 = loadImage("시스템 설정.png");
    cry_simcheong_2 = loadImage("우는 심청이.png");
    king_2 = loadImage("king.png");
    king_background_2 = loadImage("배경 이미지 파일.png");

    kingdom_2.resize(width, height);

    cry_simcheongX_2 = 472;
    cry_simcheongY_2 = 300;

    kingX_2 = 665;
    kingY_2 = 270;
  }

  void draw() {
    if (!secondScene) {
      firstScene();
    } else {
      secondScene();
    }
  }

  void firstScene() {
    background(kingdom_background_1);
    
    pushMatrix();
    translate(width / 2, height / 2);
    scale(bgScale);
    image(kingdom_1, -kingdom_1.width / 2, -kingdom_1.height / 2);
    popMatrix();
    
    pushMatrix();
    translate(739, 464);
    scale(king_1Scale);
    image(king_1, -king_1.width / 2, -king_1.height / 2);
    popMatrix();
    
    if (!king_1AnimationDone) {
      if (king_1Scale < 2.0 && !enlarged) {
        king_1Scale += 0.01; 
        bgScale += 0.01;
        if (king_1Scale >= 2.0) {
          enlarged = true;
        }
      } else if (enlarged && king_1Scale > 1.0) {
        king_1Scale -= 0.01;
        bgScale -= 0.01;
        if (king_1Scale <= 1.0) {
          king_1AnimationDone = true;
          king_1Scale = 1.0;
          bgScale = 1.0;
        }
      }
    } else {
      alpha2 = lerp(alpha2, targetAlpha, 0.05); 
      tint(255, alpha2);
      image(normal_simcheong, normal_simcheongX, normal_simcheongY);
      noTint();
      
      if (alpha2 >= targetAlpha - 1) {
        if (timerStart == 0) {
          timerStart = millis();
        } else if (millis() - timerStart > 1500) {
          secondScene = true;
          narration2.play();
        }
      }
    }
  }

  void secondScene() {
    background(king_background_2);
    
    float kingdomWidth_2 = kingdom_2.width * cry_simcheongScale_2;
    float kingdomHeight_2 = kingdom_2.height * cry_simcheongScale_2;
    float kingdomX_2 = width / 2 - kingdomWidth_2 / 2;
    float kingdomY_2 = height / 2 - kingdomHeight_2 / 2;
    image(kingdom_2, kingdomX_2, kingdomY_2, kingdomWidth_2, kingdomHeight_2);
    
    float cry_simcheongWidth_2 = cry_simcheong_2.width * cry_simcheongScale_2;
    float cry_simcheongHeight_2 = cry_simcheong_2.height * cry_simcheongScale_2;
    float adjustedCrySimcheongX_2 = kingdomX_2 + cry_simcheongX_2 * cry_simcheongScale_2;
    float adjustedCrySimcheongY_2 = kingdomY_2 + cry_simcheongY_2 * cry_simcheongScale_2;
    image(cry_simcheong_2, adjustedCrySimcheongX_2, adjustedCrySimcheongY_2, cry_simcheongWidth_2, cry_simcheongHeight_2);

    float kingWidth_2 = king_2.width * kingScale_2;
    float kingHeight_2 = king_2.height * kingScale_2;
    float adjustedKingX_2 = kingdomX_2 + kingX_2 * kingScale_2;
    float adjustedKingY_2 = kingdomY_2 + kingY_2 * kingScale_2;
    image(king_2, adjustedKingX_2, adjustedKingY_2, kingWidth_2, kingHeight_2);
  }
}
