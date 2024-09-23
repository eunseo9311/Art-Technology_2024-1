//int sceneNumber = 0;
//WaveScene waveScene;
//WalkingScene walkingScene;
//MovingScene movingScene;
//InterScene interScene;
//HairScene hairScene;
//OffScene offScene;
//FallScene fallScene;
//boolean isWaveScene = true;


//void setup() {
//  size(1280, 832);
//  waveScene = new WaveScene();
//  walkingScene = new WalkingScene();
//  movingScene = new MovingScene();
//  interScene = new InterScene();
//  hairScene = new HairScene();
//  offScene = new OffScene();
//  fallScene = new FallScene(this);
//}

//void draw() {
//  switch (sceneNumber) {
//  case 0:
//    waveScene.draw();
//    break;
//  case 1:
//    walkingScene.draw();
//    break;
//  case 2:
//    movingScene.draw();
//    break;
//  case 3:
//    interScene.draw();
//    break;
//  case 4:
//    hairScene.draw();
//    break;
//  case 5:
//    offScene.draw();
//    break;
//  case 6:
//    fallScene.draw();
//    break;
//  }

//  if (waveScene.isFinished()) {
//    sceneNumber = 1;
//  }

//  if (walkingScene.isFinished()) {
//    sceneNumber = 2;
//  }

//  if (movingScene.isFinished()) {
//    sceneNumber = 3;
//  }
  
//  if (interScene.isFinished()) {
//    sceneNumber = 4;
//    if (interScene.isHair()){
//      sceneNumber = 4;
//    } else {sceneNumber = 5;}
//  }
  
//  if (hairScene.isFinished()) {
//    sceneNumber = 6;
//  }
  
//  if (offScene.isFinished()) {
//    sceneNumber = 6;
//  }
  
//  if (fallScene.isFinished()) {
//    sceneNumber = 7;
//  }
//}
