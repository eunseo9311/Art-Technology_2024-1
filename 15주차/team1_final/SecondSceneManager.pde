import processing.sound.*;

class SecondSceneManager {
  PApplet p;
  MyClass1 obj1;
  MyClass2 obj2;
  MyClass3 obj3;
  MyClass4 obj4;
  MyClass5 obj5;
  int currentClass = 1;
  int previousTime = 0;
  int classDuration[] = {54 * 1000, 10 * 1000, 9 * 1000, 15 * 1000, 1 * 1000}; // 각 클래스의 실행 시간
  int transitionDuration = 10 * 1000; // 클래스 간 전환 딜레이

  SoundFile bgSound; // 배경음악 파일
  float bgVolume = 0.15; // 배경음악의 볼륨 (0.0 - 1.0)

  public SecondSceneManager(PApplet p) {
    frameRate(60);
    this.p = p;
     obj1 = new MyClass1(p);

    previousTime = millis();

//    // 배경음악 파일 로드
//    bgSound = new SoundFile(p, "bgS.mp3");
//    bgSound.loop(); // 배경음악을 반복 재생합니다.
//    bgSound.amp(bgVolume); // 배경음악의 볼륨을 설정합니다.
  }

  void draw() {
    int currentTime = millis();
    int elapsedTime = currentTime - previousTime;

    switch(currentClass) {
    case 1:
      if (elapsedTime > classDuration[currentClass - 1]) {
        currentClass++;

        obj2 = new MyClass2(p);
        previousTime = currentTime;
      } else {
        obj1.draw();
      }
      break;

    case 2:
      if (elapsedTime > classDuration[currentClass - 1]+ transitionDuration) {
        currentClass++;
        obj3 = new MyClass3(p);

        previousTime = currentTime;
      } else {
        obj2.draw();
      }
      break;

    case 3:
      if (elapsedTime > classDuration[currentClass - 1] + transitionDuration) {
        currentClass++;
        obj4 = new MyClass4(p);

        previousTime = currentTime;
      } else {
        obj3.draw();
      }
      break;

    case 4:
      if (elapsedTime > classDuration[currentClass - 1] + transitionDuration) {
        currentClass++;
        obj5 = new MyClass5(p);

        previousTime = currentTime;
      } else {
        obj4.draw();
      }
      break;

    case 5:
      if (elapsedTime > classDuration[currentClass - 1]) {
        obj5.draw();
        // currentClass가 6이 되면 draw() 함수가 더 이상 호출되지 않습니다.
      }
      break;
    }
    
    
    
  }
  void keyPressed(){
    obj5.keyPressed();
  }
}
