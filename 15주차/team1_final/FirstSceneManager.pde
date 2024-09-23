class FirstSceneManage {
  PApplet p;
  FirstScene1 firstScene;
  SecondScene1 secondScene;
  ThirdScene1 thirdScene;
  FourthScene1 fourthScene;
  FifthScene1 fifthScene;
  SixthScene1 sixthScene;
  SeventhScene1 seventhScene;
  EightScene1 eightScene;
  int currentScene = 1;
  int sceneNumber = 9;
  WaveScene waveScene;
  boolean isTrueEnding = true;
  WalkingScene walkingScene;
  MovingScene movingScene;
  InterScene interScene;
  HairScene hairScene;
  OffScene offScene;
  FallScene fallScene;
  boolean isWaveScene = true;
  FirstSceneManage(PApplet p) {
    this.p = p;
    firstScene = new FirstScene1(p, this);
    secondScene = new SecondScene1(p, this);
    thirdScene = new ThirdScene1(p, this);
    fourthScene = new FourthScene1(p, this);
    fifthScene = new FifthScene1(p, this);
    sixthScene = new SixthScene1(p, this);
    seventhScene = new SeventhScene1(p, this);
    eightScene = new EightScene1(p, this);

    waveScene = new WaveScene();
    walkingScene = new WalkingScene();
    movingScene = new MovingScene();
    interScene = new InterScene();
    hairScene = new HairScene();
    offScene = new OffScene();
    fallScene = new FallScene(p);

    firstScene.start();
  }

  void draw() {
    switch (currentScene) {
    case 1:
      firstScene.draw();
      break;
    case 2:
      secondScene.draw();
      break;
    case 3:
      thirdScene.draw();
      break;
    case 4:
      fourthScene.draw();
      break;
    case 5:
      fifthScene.draw();
      break;
    case 6:
      sixthScene.draw();
      break;
    case 7:
      seventhScene.draw();
      break;
    case 8:
      eightScene.draw();
      break;
    }

    switch (sceneNumber) {
    case 0:
      waveScene.draw();
      break;
    case 1:
      walkingScene.draw();
      break;
    case 2:
      movingScene.draw();
      break;
    case 3:
      interScene.draw();
      break;
    case 4:
      hairScene.draw();
      break;
    case 5:
      offScene.draw();
      break;
    case 6:
      fallScene.draw();
      break;
    }

    if (waveScene.isFinished()) {
      sceneNumber = 1;
    }

    if (walkingScene.isFinished()) {
      sceneNumber = 2;
    }

    if (movingScene.isFinished()) {
      sceneNumber = 3;
    }

    if (interScene.isFinished()) {
      sceneNumber = 4;
      if (interScene.isHair()) {
        isTrueEnding = true;
        sceneNumber = 4;
      } else {
        isTrueEnding = false;
        sceneNumber = 5;
      }
    }

    if (hairScene.isFinished()) {
      sceneNumber = 6;
    }

    if (offScene.isFinished()) {
      sceneNumber = 6;
    }

    if (fallScene.isFinished()) {
      sceneNumber = 10;
    }
  }

  void switchToSecondScene() {
    firstScene.stop();
    currentScene = 2;
    secondScene.start();
  }

  void switchToThirdScene() {
    secondScene.stop();
    currentScene = 3;
    thirdScene.start();
  }

  void switchToFourthScene() {
    thirdScene.stop();
    currentScene = 4;
    fourthScene.start();
  }

  void switchToFifthScene() {
    fourthScene.stop();
    currentScene = 5;
    fifthScene.start();
  }

  void switchToSixthScene() {
    fifthScene.stop();
    currentScene = 6;
    sixthScene.start();
  }

  void switchToSeventhScene() {
    sixthScene.stop();
    currentScene = 7;
    seventhScene.start();
  }

  void switchToEighthScene() {
    seventhScene.stop();
    currentScene = 8;
    eightScene.start();
  }
  void switchToNineScene() {
    eightScene.stop();
    sceneNumber = 0;
    currentScene = 9;
  }
  void stop() {
    firstScene.stop();
    secondScene.stop();
    thirdScene.stop();
    fourthScene.stop();
    fifthScene.stop();
    sixthScene.stop();
    seventhScene.stop();
    eightScene.stop();
  }
  void keyPressed() {
    if (sceneNumber == 3) {
      interScene.keyPressed();
    }
  }

  void mousePressed() {
    print(sceneNumber); //로킹. 프린트하는 느낌으로 데이터들을 찍어내는.
    if (sceneNumber == 3) {
      print(sceneNumber);
      interScene.mousePressed();
    }
    if (sceneNumber == 4) {
      hairScene.mousePressed();
    } else if (sceneNumber == 5) {
      offScene.mousePressed();
    }
  }

  void mouseDragged() {
    if (sceneNumber == 4) {
      hairScene.mouseDragged();
    }
  }

  void mouseReleased() {
    if (sceneNumber == 4) {
      hairScene.mouseReleased();
    }
  }
  boolean isFinished(){
    return sceneNumber >= 10;
  }
}
