Forms forma;
move mover;
Comprobador comprobar;
Colors paint;
Niveles level;
Creador crear;
Menu menu;
Menu menus;
Puntuacion points;
/************************************************************/
PImage   gn, inicio, muestra, imagen, punt;
boolean conGanador, present2=false;
boolean present =true;
boolean po=false;
boolean time=true;
int c, nivel, ini, fin, maxpoin;
color base, figCol;
color[] fig;
ArrayList<PImage>images;
int numEntero, numJson,Quad,s,m,h,mili; 
String numCadena, numCadena2;
/******************************************************************/
void setup() {
  size(800, 800);   
  gn=loadImage("win.png"); 
  inicio=loadImage("inicio.jpg");
  muestra=loadImage("niveles.jpg");
  imagen=loadImage("made.jpg");
  punt=loadImage("puntajes.jpg");
  mili=millis();
  /******************************************************************/
  forma=new Forms();
  mover=new move();
  menu=new Menu();
  comprobar=new Comprobador();
  paint=new Colors(); 
  crear=new Creador();
  base=color(194, 216, 70);
  level=new Niveles();
  menus=new Menu();
  //points=new Puntuacion();
  /******************************************************************/
  numJson=numEntero=0;
  ini=0;
  fin=40;
  fig=new color[7];
  images=new ArrayList<PImage>();
  /******************************************************************/
  for (int i=0; i<7; i++) {
    fig[i]=color(random(15, 255), random(15, 255), random(15, 255));
  }
}
void draw() { 
  frameRate(300);  
  menu.update(mouseX, mouseY);  
  if (present) {
    background(inicio);
    menus.crearMenu();
  }
  /******************************************************************/
  switch(nivel) {
  case 1:    
    level.cargPunt();
    break;
  case 2:     
     present=false;    
     crear.crear();
     crear.hecho();    
    break;
  case 3:
    crear.panNivel(); 
    break;
  case 4:
    crear.oneNivel(fig);
    break;
  case 5:
    level.mostPunt(maxpoin,Quad);
  case 20:
    present2=false;
    present=true; 
    break;
  }
  /******************************************************************/
  numCadena= String.valueOf(numEntero);
}
