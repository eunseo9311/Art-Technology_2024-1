import ddf.minim.*;  // Import the minim library

FirstSceneManage firstSceneManager;
SecondSceneManager secondSceneManager;
ThirdSceneManager thirdSceneManager;
  SoundFile bgSound; // 배경음악 파일
  float bgVolume = 0.15; // 배경음악의 볼륨 (0.0 - 1.0)

boolean isFirst = false;
int managingNumber = 0;

Ending ending;

void setup() {
  size(1280, 832);
    ending = new Ending();
    bgSound = new SoundFile(this, "bgS.mp3");
    bgSound.loop(); // 배경음악을 반복 재생합니다.
    bgSound.amp(bgVolume); // 배경음악의 볼륨을 설정합니다.
  firstSceneManager = new FirstSceneManage(this);
}

void draw() {
  switch(managingNumber) {
    case 0 :    
      firstSceneManager.draw();
      break;
    case 1:
      if(secondSceneManager == null){        
        secondSceneManager = new SecondSceneManager(this);
      }
      secondSceneManager.draw();
      break;
    case 2 :
      if(thirdSceneManager == null){
        thirdSceneManager = new ThirdSceneManager(this);
      }        
      thirdSceneManager.draw();
      break;
    case 3 :
      ending.draw();
      bgSound.pause();
      break;
  }
  
  if(firstSceneManager.isFinished() && managingNumber == 0){
    if(firstSceneManager.isTrueEnding){
      managingNumber = 1;    
    }else{
    managingNumber = 2;    
    
    }
  }


}
  void keyPressed() {
    if(managingNumber == 0){
       firstSceneManager.keyPressed();
    }
    if(managingNumber == 1){
      secondSceneManager.keyPressed();
    }
    if (managingNumber == 2){    
      thirdSceneManager.keyPressed();
    }
    
    if(key == '1'){
      managingNumber = 1;

    }
    
    if(key == '2'){
      managingNumber = 2;

    }
    if(key == '3'){
      if(!isFirst){
        isFirst = true;
      managingNumber = 0;
      firstSceneManager.currentScene = 9;
      firstSceneManager.sceneNumber = 3;
      secondSceneManager = null;
      firstSceneManager.isTrueEnding = false;
      
      }
      
    }
    
    if(key == 'g'){
      managingNumber = 3;
      ending.video.loop();
      ending.startCredits(); 

    }
    
  }
void mousePressed() {
  firstSceneManager.mousePressed();
  if (firstSceneManager.currentScene == 5) {
    firstSceneManager.fifthScene.mousePressed();
  }
}

void mouseReleased() {
  firstSceneManager.mouseReleased();
  if (firstSceneManager.currentScene == 5) {
    firstSceneManager.fifthScene.mouseReleased();
  }
  if(managingNumber ==1){
    
  }
}

void mouseDragged() {
      firstSceneManager.mouseDragged();

  if (firstSceneManager.currentScene == 5) {
    firstSceneManager.fifthScene.mouseDragged();
  }
}

void keyReleased(){
  if(managingNumber == 2){
    thirdSceneManager.keyReleased();
  }
}
void mouseClicked(){
if(managingNumber == 2){
    thirdSceneManager.mouseClicked();
  }
}

void stop() {
  firstSceneManager.stop();
  super.stop();
}
