class Scene {
  int currentFrameCount = 0;
  int stopFrameCount;
  void draw() {
    currentFrameCount ++;
  }
  boolean isFinished() {
    return currentFrameCount >= stopFrameCount;
  }
}
