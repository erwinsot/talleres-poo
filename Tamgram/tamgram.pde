import processing.serial.*;
PImage img, bg,gn;
int rectX, rectY;      
int circleX, circleY;  
int rectSize = 100;     
int circleSize = 93;   
color rectColor, circleColor, baseColor,triColor,triColor2,triColor3,triColor4 ;
color rectHighlight,trihilight, circleHighlight;
color currentColor;
boolean rectOver = false;
boolean circleOver = false;
boolean triOver,triOver2, triOver3,triOver4,triOver5,quadOver=false;
boolean move,move1,move2,move3,move4,move5,move6= false;
boolean rotar=false;
float rota,rota1,rota2,rota3,rota4,rota5,rota6=0;
PShape s,t,u,w,p,qu;  
float x,y,x1,y1,x2,y2,baricentroY, baricentroX;
float po1,po2,po3,po4,po5,po6,po7,po8,po9,po10,po11,po12;
float qux,quy,qux1,quy1,qux2,quy2,qux3,quy3;
int c;
float quCenx,quCeny;
boolean conGanador;

void setup() {
  size(800, 800);
  img=loadImage("tam1.png");
  bg=loadImage("made.jpg"); 
  gn=loadImage("win.png");
  qux=-150;
  quy=-50;
  qux1=100;
  quy1=-50;
  qux2=-50;
  quy2=50;
  qux3=200;
  quy3=50;
  x=-150;
  y=110;
  x1=0;
  y1=-110;
  x2=150;
  y2=110;
  baricentroX=(x+x1+x2)/3;
  baricentroY=(y+y1+y2)/3;
  qu= createShape();
  qu.beginShape();
  //s.fill(0, 0, 255);
  qu.noStroke();
  qu.vertex(qux,quy);
  qu.vertex(qux2,quy2);
  qu.vertex(qux3, quy3);
  qu.vertex(qux1,quy1);  
  qu.endShape(CLOSE);
  p= createShape();
  p.beginShape();
  //s.fill(0, 0, 255);
  p.noStroke();
  p.vertex(x,y-baricentroY);
  p.vertex(x1, y1+baricentroY);
  p.vertex(x2, y2-baricentroY);  
  p.endShape(CLOSE);
  w= createShape();
  w.beginShape();
  //s.fill(0, 0, 255);
  w.noStroke();
  w.vertex(x,y-baricentroY);
  w.vertex(x1, y1+baricentroY);
  w.vertex(x2, y2-baricentroY);  
  w.endShape(CLOSE);
  s = createShape();
  s.beginShape();
  //s.fill(0, 0, 255);
  s.noStroke();
  s.vertex(x,y-baricentroY);
  s.vertex(x1, y1+baricentroY);
  s.vertex(x2, y2-baricentroY);  
  s.endShape(CLOSE);
  t = createShape();
  t.beginShape();
  //s.fill(0, 0, 255);
  t.noStroke();
  t.vertex(x,y-baricentroY);
  t.vertex(x1, y1+baricentroY);
  t.vertex(x2, y2-baricentroY);  
  t.endShape(CLOSE);
  u = createShape();
  u.beginShape();
  //s.fill(0, 0, 255);
  u.noStroke();
  u.vertex(x,y-baricentroY);
  u.vertex(x1, y1+baricentroY);
  u.vertex(x2, y2-baricentroY);  
  u.endShape(CLOSE);
  rectColor = color(17,237,224);
  rectHighlight = color(255,46,46);
  trihilight=color(0,155,12);
  circleColor = color(255);
  triColor=color(2,206,126);
  triColor2=color(182,2,206);
  triColor3=color(224,154,2);
  triColor4=color(216,250,28);
  circleHighlight = color(204);
  baseColor = color(0,93,211);
  currentColor = baseColor;
  circleX = width/2;   
  circleY = height/2;
  rectX = width/2+100;
  rectY = height/2;
  quCenx=(qux2+qux1)/2;
  quCeny=(quy2+quy1)/2;
  po1=150;
  po2=150;
  po3=600;
  po4=700;
  po5=200;
  po6=700;
  po7=400;
  po8=700;
  po9=700;
  po10=200;
  po11=130;
  po12=400;
  imageMode(CENTER);
  ellipseMode(CENTER);
  rectMode(CENTER); 
 
  
}
void draw(){ 
  frameRate(120);  
  update(mouseX, mouseY);
  background(bg);  
  image(img,width/2,height/2);
  
 
//////////////////////////////rectangulo/////////////////////////////////////////////////////////
noStroke();
verificador(rectOver);           
  if (move== true && rectOver==true){    
    if (keyPressed){
      if (keyCode==UP){
      rota=rota+0.01;
      delay(10);
    }
    if (keyCode==DOWN){
      rota=rota-0.01;
      delay(10);
    }
    }  
    if (rota!=0){
      pushMatrix();
      translate(rectX,rectY);
      rotate(rota);
      rect(0, 0,rectSize,rectSize);  
      popMatrix();
      rectX=mouseX;
      rectY=mouseY;      
    }
    if (rota==0){
    rectX=mouseX;
    rectY=mouseY;
    rect(mouseX, mouseY,rectSize,rectSize);    
    }    
   }
   else {
     if (rota!=0  ){          
      pushMatrix();
      translate(rectX,rectY);
      rotate(rota);
      rect(0, 0,rectSize,rectSize);  
      popMatrix();
    }
    else{
      rect(rectX, rectY,rectSize,rectSize);
    }      
    }
/////////////////////////////////triangulo///////////////////////////////////////////////    
  verificador2(triOver);
    if (move1== true && triOver==true){    
    if (keyPressed){
      rota1=rota1+PI/4;
      delay(70);
    }  
    if (rota1>0){
      pushMatrix();
      translate(po1,po2);
      rotate(rota1);
      shape(s,0,0); 
      popMatrix();
      po1=mouseX;
      po2=mouseY;      
    }
    if (rota1==0){
    po1=mouseX;
    po2=mouseY;
    shape(s,mouseX,mouseY);    
    }    
   }
   else{
     if (rota1>0 ){          
      pushMatrix();      
      translate(po1,po2);
      rotate(rota1);
      shape(s,0,0);  
      popMatrix();
    }
    else{
      shape(s,po1,po2);
    }      
    }
 ////////////////////////////trriangulo 2/////////////////////////////////////////////
 verificador3(triOver2);
    if (move2== true && triOver2==true){    
    if (keyPressed){
      rota2=rota2+PI/4;
      delay(70);
    }  
    if (rota2>0){
      pushMatrix();
      translate(po3,po4);
      rotate(rota2);
      shape(t,0,0); 
      popMatrix();
      po3=mouseX;
      po4=mouseY;      
    }
    if (rota2==0){
    po3=mouseX;
    po4=mouseY;
    shape(t,mouseX,mouseY);    
    }    
   }
   else{
     if (rota2>0 ){          
      pushMatrix();      
      translate(po3,po4);
      rotate(rota2);
      shape(t,0,0);  
      popMatrix();
    }
    else{
      shape(t,po3,po4);
    }      
    } 
   ////////////////////////////////triangulo3////////////////////////////////////////////////////////////////
   verificador4(triOver3);
    if (move3== true && triOver3==true){    
    if (keyPressed){
      if (keyCode==UP){
      rota3=rota3+0.01;
      delay(10);
    }
    if (keyCode==DOWN){
      rota3=rota3-0.01;
      delay(10);
    }
    }   
    if (rota3!=0){
      pushMatrix();
      translate(po5,po6);
      rotate(rota3);
      shape(u,0,0,75,37.5); 
      popMatrix();
      po5=mouseX;
      po6=mouseY;      
    }
    if (rota3==0){
    po5=mouseX;
    po6=mouseY;
    shape(u,mouseX,mouseY,75,37.5);    
    }    
   }
   else{
     if (rota3!=0 ){          
      pushMatrix();      
      translate(po5,po6);
      rotate(rota3);
      shape(u,0,0,75,37.5);  
      popMatrix();
    }
    else{
      shape(u,po5,po6,75,37.5);
    }      
    } 
    //////////////////////////////////////////triangulo 4/////////////////////////////////////////////////////////////////
      verificador5(triOver4);
    if (move4== true && triOver4==true){    
    if (keyPressed){
      if (keyCode==UP){
      rota4=rota4+0.01;
      delay(10);
    }
    if (keyCode==DOWN){
      rota4=rota4-0.01;
      delay(10);
    }
    }   
    if (rota4!=0){
      pushMatrix();
      translate(po7,po8);
      rotate(rota4);
      shape(w,0,0,75,35.5); 
      popMatrix();
      po7=mouseX;
      po8=mouseY;      
    }
    if (rota4==0){
    po7=mouseX;
    po8=mouseY;
    shape(w,mouseX,mouseY,75,37.5);    
    }    
   }
   else{
     if (rota4!=0 ){          
      pushMatrix();      
      translate(po7,po8);
      rotate(rota4);
      shape(w,0,0,75,37.5);  
      popMatrix();
    }
    else{
      shape(w,po7,po8,75,37.5);
    }      
    } 
   //////////////////////////////////////////////////triangulo 5////////////////////////////////////////////////////////////
      verificador6(triOver5);
    if (move5== true && triOver5==true){    
    if (keyPressed){
      if (keyCode==UP){
      rota5=rota5+0.01;
      delay(10);
    }
    if (keyCode==DOWN){
      rota5=rota5-0.01;
      delay(10);
    }
    }   
    if (rota5!=0){
      pushMatrix();
      translate(po9,po10);
      rotate(rota5);
      shape(p,0,0,100,50); 
      popMatrix();
      po9=mouseX;
      po10=mouseY;      
    }
    if (rota5==0){
    po9=mouseX;
    po10=mouseY;
    shape(p,mouseX,mouseY,100,50);    
    }    
   }
   else{
     if (rota5!=0 ){          
      pushMatrix();      
      translate(po9,po10);
      rotate(rota5);
      shape(p,0,0,100,50);  
      popMatrix();
    }
    else{
      shape(p,po9,po10,100,50);
    }      
    } 

  /////////////////////////////////////quad///////////////////////////////////////////////
   verificador7(quadOver);
    if (move6== true && quadOver==true){    
    if (keyPressed){
      if (keyCode==UP){
      rota6=rota6+0.01;
      delay(10);
    }
    if (keyCode==DOWN){
      rota6=rota6-0.01;
      delay(10);
    }
    }   
    if (rota6!=0){
      pushMatrix();
      translate(po11,po12);
      rotate(rota6);
      shape(qu,0,0,120,32); 
      popMatrix();
      po11=mouseX;
      po12=mouseY;      
    }
    if (rota6==0){
    po11=mouseX;
    po12=mouseY;
    shape(qu,mouseX,mouseY,120,32);    
    }    
   }
   else{
     if (rota6!=0 ){          
      pushMatrix();      
      translate(po11,po12);
      rotate(rota6);
      shape(qu,0,0,120,32);  
      popMatrix();
    }
    else{
      shape(qu,po11,po12,120,32);
    }      
    } 
    if (keyPressed) {
    if (key == 'g' || key == 'G') {
      ganador();
      delay(200);
    }
    
 }
 gane();
}
void verificador7(boolean figura){
  if (figura) {
    
    qu.setFill(baseColor);
  } else {
    qu.setFill(triColor);
  }  
}
void verificador6(boolean figura){
  if (figura) {
    
    p.setFill(baseColor);
  } else {
    p.setFill(triColor2);
  }  
}
void verificador5(boolean figura){
  if (figura) {
    
    w.setFill(baseColor);
  } else {
    w.setFill(triColor3);
  }  
}
void verificador4(boolean figura){
  if (figura) {
    
    u.setFill(baseColor);
  } else {
    u.setFill(triColor4);
  }  
}
void verificador3(boolean figura){
  if (figura) {
    
    t.setFill(baseColor);
  } else {
    t.setFill(trihilight);
  }  
}
void verificador2(boolean figura){
  if (figura) {
    
    s.setFill(baseColor);
  } else {
    s.setFill(rectColor);
  }  
}
void verificador(boolean figura){
  if (figura) {
    fill(baseColor);
  } else {
    fill(rectHighlight);
  }  
}


void update(int x, int y) {
  if ( overCircle(circleX, circleY, circleSize) ) {
    circleOver = true;
    
  } else if ( overRect(rectX, rectY, rectSize, rectSize) ) {
    rectOver = true;
    triOver=triOver2=triOver3=triOver4=triOver5=false;
    
  }
  else if ( overTri(baricentroX,baricentroY,x2,y2) ) {   
    triOver=true;
    rectOver=triOver2=triOver3=triOver4=triOver5=false;
  }
  else if ( overTri2(baricentroX,baricentroY,x2,y2) ) {    
    triOver2=true;
    rectOver=triOver=triOver3=triOver4=triOver5=false;
  }
  else if ( overTri3(baricentroX,baricentroY,x2,y2) ) {  
    triOver3=true;
    rectOver=triOver2=triOver=triOver4=triOver5=false;
  }
  else if ( overTri4(baricentroX,baricentroY,x2,y2) ) {    
    triOver4=true;
    rectOver=triOver2=triOver3=triOver=triOver5=false;
  }
  else if ( overTri5(baricentroX,baricentroY,x2,y2) ) {    
    triOver5=true;
    rectOver=triOver2=triOver3=triOver4=triOver=false;
  }
  else if ( overQuad(quCenx,quCeny,qux,quy) ) {    
    quadOver=true;
    triOver5=rectOver=triOver2=triOver3=triOver4=triOver=false;
  }
  
  else {
    quadOver=triOver5=triOver4=triOver3=triOver2=triOver=circleOver = rectOver = false;
  }
}

void mouseClicked() {
 
  if (circleOver && move ==false) {
    move=true;
  }
  else if(move==true && circleOver){
    move=false;
  }
  if (move ==false && rectOver==true  ) {
    move=true;
  }
  else if(move == true && rectOver==true) {
    move=false;
    
  }
  if (move1 ==false && triOver==true  ) {
    move1=true;
  }
  else if(move1 == true && triOver==true) {
    move1=false;
    
  }
  if (move2 ==false && triOver2==true  ) {
    move2=true;
  }
  else if(move2 == true && triOver2==true) {
    move2=false;
    
  }
   if (move3 ==false && triOver3==true  ) {
    move3=true;
  }
  else if(move3 == true && triOver3==true) {
    move3=false;
    
  }
    if (move4 ==false && triOver4==true  ) {
    move4=true;
  }
  else if(move4 == true && triOver4==true) {
    move4=false;
    
  }
     if (move5 ==false && triOver5==true  ) {
    move5=true;
  }
  else if(move5 == true && triOver5==true) {
    move5=false;
    
  }
     if (move6 ==false && quadOver==true  ) {
    move6=true;
  }
  else if(move6 == true && quadOver==true) {
    move6=false;
    
  }
}
boolean overQuad(float quCenx, float quCeny,float x,float y ){
  float disX = po11 - mouseX;
  float disY = po12 - mouseY;
  float disX1 =quCenx-x;
  float disY1 =quCeny-y;
  
  if (sqrt(sq(disX) + sq(disY))< sqrt(sq(disX1) + sq(disY1))-100){
    
    return true;
  } else{
    return false;
  }
  
}
boolean overTri5(float bariX, float bariY,float x,float y ){
  float disX = po9 - mouseX;
  float disY = po10 - mouseY;
  float disX1 = bariX-x;
  float disY1 =bariY-y;
  
  if (sqrt(sq(disX) + sq(disY))< sqrt(sq(disX1) + sq(disY1))-100){
    
    return true;
  } else{
    return false;
  }
  
}
boolean overTri4(float bariX, float bariY,float x,float y ){
  float disX = po7 - mouseX;
  float disY = po8 - mouseY;
  float disX1 = bariX-x;
  float disY1 =bariY-y;
  
  if (sqrt(sq(disX) + sq(disY))< sqrt(sq(disX1) + sq(disY1))-100){
    
    return true;
  } else{
    return false;
  }
  
}
boolean overTri3(float bariX, float bariY,float x,float y ){
  float disX = po5 - mouseX;
  float disY = po6 - mouseY;
  float disX1 = bariX-x;
  float disY1 =bariY-y;
  
  if (sqrt(sq(disX) + sq(disY))< sqrt(sq(disX1) + sq(disY1))-100){
    
    return true;
  } else{
    return false;
  }
  
}
boolean overTri2(float bariX, float bariY,float x,float y ){
  float disX = po3 - mouseX;
  float disY = po4 - mouseY;
  float disX1 = bariX-x;
  float disY1 =bariY-y;
  
  if (sqrt(sq(disX) + sq(disY))< sqrt(sq(disX1) + sq(disY1))-100){
    
    return true;
  } else{
    return false;
  }
  
}
boolean overTri(float bariX, float bariY,float x,float y ){
  float disX = po1 - mouseX;
  float disY = po2 - mouseY;
  float disX1 = bariX-x;
  float disY1 =bariY-y;
  
  if (sqrt(sq(disX) + sq(disY))< sqrt(sq(disX1) + sq(disY1))-100){
    
    return true;
  } else{
    return false;
  }
  
}
boolean overRect(int x, int y, int ancho, int alto)  {
  
  if ((mouseX <= x && mouseX >= x-ancho/2  && (mouseY <= y && mouseY >= y-alto/2 ||
        mouseY>=y && mouseY<=y+alto/2)) || (mouseX>=x  && mouseX <= x+ancho/2 && (mouseY <= y &&
        mouseY>=y-alto/2 || mouseY>=y && mouseY<y+alto/2)) ){
    return true;
  } else {
    return false;
  }
}


boolean overCircle(int x, int y, int diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } else {
    return false;
  }
}
void ganador(){
  loadPixels();
  for (int i =200250; i <200550; i++){
    for (int j=0; j<300; j++){
      int hu=i+j*800;
      if (pixels[hu]==color(255)){
        c++;             
        }        
      }     
    }
    print(c,"\n");
     if (c<5000){
        conGanador=true;
      }
     else {
       conGanador=false;
     }
    c=0;   
}
void gane(){
  if (conGanador==true){
    image(gn,width/2,height/2);
  }
} 
