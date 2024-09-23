/*
int i = 0;
  while(i < 10){
    println(i);
    i++;
  }
*/


/*
int i = 10;
  while(i >= 0){
    println(i);
    i--;
  }
*/



/* 
int i = 0;
  while(i < 10){
    if(i % 2 == 0){
      println(i);
    }
    i++; //if outside !!
  }
*/



/*
void setup(){
  size(600,600);
}


void draw(){
  background(255);
  
  int x = 0;
  while(x < width){
    line(x,0,x,height);
    x += 10;
  } //end of while
  
} //end of draw
*/


/*
void setup(){
  size(600,600);
}


void draw(){
  background(255);
  
  int x = -100;
  while(x < width){
    line(x,0,x+30,height);
    x += 20;
  }
  
}
*/


/*  ??????? error
void setup(){
  size(600,600);
}


void draw(){
  background(255);
  while(x < width){
    line(x,0,x,height);
    strokeWeight(x/3);
    x += 20;
  } //end of while
  
}//end of draw
*/



/*
int i = 0;
while(i < 10){
  println(int(random(100)));
  i++;
}
*/




/*
void setup(){
  size(600,600);
}


void draw(){
  int lines = 0;
  background(255);
  while(lines < 10){
    strokeWeight(random(10));
    stroke(random(255),random(255),random(255));
    line(mouseX,mouseY,random(width),random(height));
    lines++;
  } //end of while
  
} //end of draw

*/



/*
int thickness = 30;

void setup(){
  size(400, 400);
  stroke(128);
  strokeWeight(3);
}

void draw(){
  int lines = 0;
  
  background(255);
  while(lines < 30){
    stroke( 255, random(255), random(255) );
    line(random(0, thickness), random(0, thickness), random(width-thickness, width), random(0, thickness) );
    line(random(0, thickness), random(height-thickness, height), random(width-thickness, width), random(height-thickness, height) );
    line(random(0, thickness), random(0, thickness), random(0, thickness), random(height-thickness, height) );
    // the last line... by yourselves....
    line(random(width-thickness, width), random(0, thickness), random(width-thickness, width), random(height-thickness, height) );
    lines++;
  }
}

*/




/* for 

size(600,600);
background(255);
for(int i = 0; i < width; i+= 10){
  line(i,0,i,height);
}

*/




/*
void setup(){
  size(600,600);
  frameRate(2);
}


void draw(){
  for(int x=0; x < width; x += 30){
    for(int y=0; y < height; y +=30){
      fill(random(255),random(255),random(255));
      rect(x,y,30,30);
    } //end of for: y
  } //end of for: x
} //end of draw

*/



/*

void setup(){
  size(900, 900);
  noStroke();
}

void draw(){
  background(0);
  for(int x = 0; x < width; x += 30){
    for(int y = 0; y < height; y += 30){
      float radius = dist(mouseX, mouseY, x, y);
      radius = radius / 15;
      ellipse(x+15, y+15, radius, radius);
    } //end of for: x
  } //end of for: y
  
} //end of draw
*/



/* for !!!!! very important !!!!


for(int i = 0; i < 10; i++){
  println(i);
}


for(int i = 0; i < width; i = i + 10){
  line(i, 0, i, height);
}


//this is wrong....
for(int i = 0; i <= 10; i++){
  if(i % 2 == 0);
  println(i);
}



//this is right !!!!!!!
for(int i =0; i <= 10; i++){
  if(i % 2 == 0){
    println(i);
  }
}


for(int i = 0; i <= 10; i+= 2){
  println(i);
}



for(int i = 0; i < width; i = i + 10){
  line(i,0,i,height);
}


*/


// =========================================


// color rainbow
/*

size(600,600);

//red
fill(255,0,0);
ellipse(100,300,50,50);

//orange
fill(230,110,0);
ellipse(200,300,50,50);

//yellow
fill(255,255,0);
ellipse(300,300,50,50);

//green
fill(0,255,0);
ellipse(400,300,50,50);

//blue
fill(0,0,255);
ellipse(500,300,50,50);

//dip blue
fill(10,40,80);
ellipse(100,400,50,50);

//purple
fill(150,50,250);
ellipse(200,400,50,50);
*/


/* how to strech.....?? in processing

size(600,600);

fill(random(255),random(255),random(255));
  triangle(100,300,300,300,200,100);
*/



// moving ball_ dynamic mode
/*
int x, y;

void setup(){
  size(600,600);
  x = 0;
  y = 100;
}


void draw(){
  background(255);
  ellipse(x,y,50,50);
  x = x + 3;
}

*/



/*   //background (o)
int x;


void setup(){
  size(600, 400);
  x = 0;
}

void draw(){
  //background(200);
  ellipse(x, 100, 50, 50);
  x = x + 1;
}
*/



// bouncing backword !!!!!! important

/*
int x, y;
int diam; // ball's diameter
int xdir;

void setup(){
  size(600, 400);
  x = 300;
  y = 100;
  diam = 30;
  xdir = +4;
}

void draw(){
  background(200);
  ellipse(x, y, diam, diam);
  x = x + xdir; // ball movement
  
  if (x + diam/2 > 600){
    //change the direction.
    xdir = xdir * -1;
    fill(255,0,0);
  }
  
  if (x - diam/2 < 0){
    xdir = xdir * -1;
    fill(255,255,0);
  }
}

*/



/*     // if
int a = -10;

if (a < 0){
  println(a,"is negative.");
}

if (a > 0){
  println(a,"is positive.");
}

*/
