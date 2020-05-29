Forms forma;
move mover;
Comprobador comprobar;
Colors paint;
Complement trans1, trans2, trans3, trans4, trans5, trans6, trans7;
PImage  bg, gn;
boolean rectOver, triOver, triOver2, triOver3, triOver4, triOver5, quadOver=false;
boolean move, move1, move2, move3, move4, move5, move6= false;
boolean rotar=false;
boolean conGanador;
int c;
color base;
void setup() {
  size(800, 800); 
  bg=loadImage("made.jpg"); 
  gn=loadImage("win.png"); 
  forma=new Forms();
  mover=new move();
  comprobar=new Comprobador();
  paint=new Colors(); 
  trans1=new Complement();
  trans2=new Complement();
  trans3=new Complement();
  trans4=new Complement();
  trans5=new Complement();
  trans6=new Complement();
  trans7=new Complement();
  base=color(194,216,70);
}
void draw() { 
  frameRate(120);  
  update(mouseX, mouseY);
  background(bg);   
  fill(0);
  square(width/2, height/2, 301);
  noStroke();
  //////////////////////////////rectangulo/////////////////////////////////////////////////////////  
  paint.verificador(rectOver, base, 20);   
  trans1.total(move, rectOver, 2);
  //////////////////////////////////////triangulo1/////////////////////////////////////////////////
  paint.verificador(triOver, base, 50);
  trans2.total(move1, triOver, 3);
  /////////////////////////////////triangulo2/////////////////////////////////////////////////////    
  paint.verificador(triOver2, base, 255);
  trans3.total(move2, triOver2, 3);
  ////////////////////////////trriangulo 3///////////////////////////////////////////////////////
  paint.verificador(triOver3, base, 255);
  trans4.total(move3, triOver3, 3, 75, 37.5);
  ////////////////////////////////triangulo4/////////////////////////////////////////////////////
  paint.verificador(triOver4, base, 255);
  trans5.total(move4, triOver4, 3, 75, 37.5);
  //////////////////////////////////////////triangulo 5/////////////////////////////////////////
  paint.verificador(triOver5, base, 255);
  trans6.total(move5, triOver5, 3, 100, 50);
  //////////////////////////////////////////////////quad////////////////////////////////////////
  paint.verificador(quadOver, base, 255);
  trans7.total(move6, quadOver, 1, 120, 32);
  //////////////////////////////////////////////////////////////////////////////////////////////
  if (keyPressed) {
    if (key == 'g' || key == 'G') {
      ganador();
      delay(200);
    }
  }
  gane();
}
/////////////////////////////////////////////comprobador////////////////////////////////////////
void update(int x, int y) {    
  if ( comprobar.overRect(trans1.getTransx(), trans1.getTransy()) ) {
    rectOver = true;
    quadOver=triOver=triOver2=triOver3=triOver4=triOver5=false;
  } else if ( comprobar.overTri(trans2.getTransx(), trans2.getTransy()) ) {   
    triOver=true;
    quadOver=rectOver=triOver2=triOver3=triOver4=triOver5=false;
  } else if ( comprobar.overTri(trans3.getTransx(), trans3.getTransy()) ) {    
    triOver2=true;
    quadOver=rectOver=triOver=triOver3=triOver4=triOver5=false;
  } else if ( comprobar.overTri(trans4.getTransx(), trans4.getTransy())) {  
    triOver3=true;
    quadOver=rectOver=triOver2=triOver=triOver4=triOver5=false;
  } else if ( comprobar.overTri(trans5.getTransx(), trans5.getTransy())) {    
    triOver4=true;
    quadOver=rectOver=triOver2=triOver3=triOver=triOver5=false;
  } else if (comprobar.overTri(trans6.getTransx(), trans6.getTransy())) {   
    triOver5=true;
    quadOver=rectOver=triOver2=triOver3=triOver4=triOver=false;
  } else if (comprobar.overQuad(trans7.getTransx(), trans7.getTransy())) {
    quadOver=true;
    triOver5=rectOver=triOver2=triOver3=triOver4=triOver=false;
  } else {
    quadOver=triOver5=triOver4=triOver3=triOver2=triOver=rectOver = false;
  }
}
/////////////////////////////////////////click//////////////////////////////////////////////////
void mouseClicked() { 
  if (move ==false && rectOver==true  ) {
    move=true;
  } else if (move == true && rectOver==true) {
    move=false;
  }
  if (move1 ==false && triOver==true  ) {
    move1=true;
  } else if (move1 == true && triOver==true) {
    move1=false;
  }
  if (move2 ==false && triOver2==true  ) {
    move2=true;
  } else if (move2 == true && triOver2==true) {
    move2=false;
  }
  if (move3 ==false && triOver3==true  ) {
    move3=true;
  } else if (move3 == true && triOver3==true) {
    move3=false;
  }
  if (move4 ==false && triOver4==true  ) {
    move4=true;
  } else if (move4 == true && triOver4==true) {
    move4=false;
  }
  if (move5 ==false && triOver5==true  ) {
    move5=true;
  } else if (move5 == true && triOver5==true) {
    move5=false;
  }
  if (move6 ==false && quadOver==true  ) {
    move6=true;
  } else if (move6 == true && quadOver==true) {
    move6=false;
  }
}
/////////////////////////////////////////////win/////////////////////////////////////////////////
void ganador() {
  loadPixels();
  for (int i =200250; i <200550; i++) {
    for (int j=0; j<300; j++) {
      int hu=i+j*800;
      if (pixels[hu]==color(0)) {
        c++;
      }
    }
  }
  print(c, "\n");
  if (c<5000) {
    conGanador=true;
  } else {
    conGanador=false;
  }
  c=0;
}
/////////////////////////////////////win2//////////////////////////////////////////////////////////
void gane() {
  if (conGanador==true) {
    image(gn, width/2, height/2);
  }
} 
