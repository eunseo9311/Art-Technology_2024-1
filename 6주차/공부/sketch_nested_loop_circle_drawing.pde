void setup() {
  size(900, 900);
  noStroke();
}

//nested loop (for inside for)
void draw() {
  background(0);
  for (int x = 0; x < width; x += 30){
    for (int y = 0; y < height; y +=30){
    float radius = dist(mouseX, mouseY, x, y);
    radius = radius / 15;
    ellipse(x+15, y+15, radius, radius);
  }//end of y
 }//end of x
 
 
}//end of draw
