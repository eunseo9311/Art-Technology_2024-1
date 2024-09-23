void setup() {
  size(800, 600);
}

void draw() {
  background(128);
  


if (mousePressed) {
  rect(mouseX, mouseY, 50, 50);
}  // end of if
else {
ellipse(mouseX,mouseY,50,50);  
} // end of else

} // end of draw