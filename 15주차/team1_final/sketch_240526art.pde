class ThirdSceneManager {

  Scene3 firstScene;
  Scene3 secondScene;
  Scene3 thirdScene;
  Scene3 cartoonScene;
  Scene3 forthScene;
  Scene3 gameScene;
  Scene3 endingScene;

  PImage test;
  int sceneTime= 0;
  int sceneNumber = 0;


  public ThirdSceneManager(PApplet p) {
    size(1280, 832);
    firstScene = new FirstScene(p);
    secondScene = new SecondScene(p);
    thirdScene = new ThirdScene(p);
    forthScene = new ForthScene();
    cartoonScene = new CartoonScene(p);
    gameScene = new GameScene(p);
    endingScene = new TwoEndingScene(p);
    frameRate(60);
  }
  void draw() {

    pushMatrix();
    switch(sceneNumber) {
    case 0:
      firstScene.draw();
      firstScene.fadeIn();
      break;
    case 1:
      secondScene.draw();
      break;
    case 2:
      firstScene.stop();
      gameScene.draw();
      gameScene.fadeIn();
      break;
    case 3:
      gameScene.stop();
      thirdScene.draw();
      thirdScene.fadeIn();
      break;
    case 4:
      cartoonScene.draw();
      cartoonScene.fadeIn();
      break;
    case 5:
      forthScene.draw();
      forthScene.fadeIn();
      break;
    case 6:
      endingScene.draw();
      endingScene.fadeIn();
      break;
    }
    popMatrix();

    setSceneNumber(firstScene, 1);
    setSceneNumber(secondScene, 2);
    setSceneNumber(gameScene, 3);
    setSceneNumber(thirdScene, 4);
    setSceneNumber(cartoonScene, 5);
    setSceneNumber(forthScene, 6);
  }

  void keyPressed() {
    pushMatrix();
    if (sceneNumber == 2) {
      gameScene.keyPressed();
    }
    popMatrix();
  }

  void keyReleased() {
    pushMatrix();
    if (sceneNumber == 2) {

      gameScene.keyReleased();
    }
    popMatrix();
  }
  void setSceneNumber(Scene3 scene, int number) {
    if (scene.isFinished()) {
      sceneNumber = number;
    }
  }

  void mouseClicked() {
    if (sceneNumber == 4) {
      cartoonScene.mouseClicked();
    }
  }
}
