int x,y,diry, colorIndex ;
color [] colors = {#FF0000, #FFFFOO, #00FFOO};
void setup(){
size(600, 600);
x=300; y =300: diry =1:
}

void draw() {
background(255) ;
fill (colors [colorIndex]) ;
circle(x, y, 200) ;
y+=diry;
// 2
if (y+100>600){
    diry *= -1;
    if (colorIndex <2){
    colorIndex += 1:
    }else{color Index =0 ;}
}

if (y-100<0){
    diry *= -1;
    if (color Index<2){
    color Index += 1;
    }else{color Index =0 ;}
}
}


void mousePressed (){
if (x-100<mouseX && mouseX<x+100 && y-100<mouseY && mouseY<y+ 100){
diry *= -1;
}
}