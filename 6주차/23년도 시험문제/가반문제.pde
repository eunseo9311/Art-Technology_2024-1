int x;
int y;

void setup(){
  size(600,600);
  x = 400;
  y = 400;
}

void draw(){
 background(255);
 fill(0);
 rect(200,200,50,50);
 fill(200);
 rect(400,200,50,50); 
 fill(40);
 ellipse(x,y,50,50);
 
   if(mouseX <= 250 && mouseX >= 200 && mouseY >= 200 && mouseY <= 250 && mousePressed){
     background(0);
       x = x - 1;
       ellipse(x,y,50,50);
   }
   
   if(mouseX <= 450 && mouseX >= 400 && mouseY >= 200 && mouseY <= 250 && mousePressed){
     background(200);
       x = x + 1;
       ellipse(x,y,50,50);
   }
 
}