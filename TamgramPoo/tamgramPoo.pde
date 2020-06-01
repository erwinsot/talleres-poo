Forms forma;
move mover;
Comprobador comprobar;
Colors paint;
Niveles level;
Creador crear;
Menu menus;
PImage  bg, gn, inicio, muestra, imagen;
boolean rotar=false;
boolean conGanador, iniciar, iniciar2, iniciar3, present2=false;
boolean present =true;
boolean po=false;
int c, nivel, ini, fin;
color base, figCol;
color[] fig;
ArrayList<PImage>images;
int numEntero; 
String numCadena;

void setup() {
  size(800, 800);   
  gn=loadImage("win.png"); 
  inicio=loadImage("inicio.jpg");
  muestra=loadImage("niveles.jpg");
  imagen=loadImage("made.jpg");
  forma=new Forms();
  mover=new move();
  comprobar=new Comprobador();
  paint=new Colors(); 
  crear=new Creador();
  base=color(194, 216, 70);
  level=new Niveles();
  menus=new Menu();
  numEntero=0;
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
  frameRate(220);  
  update(mouseX, mouseY);   
  if (present) {
    background(inicio);
    menus.crearMenu();
  }
  /******************************************************************/
  switch(nivel) {
  case 1:  
    crear.oneNivel(fig);
    break;
  case 2:    
    present=false;    
    crear.crear();
    crear.hecho();    
    break;
  case 3:
    background(muestra);
    for (int i =0; i<images.size(); i++) {
      ini=80*(i)+100;     
      crear.levels(ini, fin, i);
    }  
  case 20:
    present2=false;
    present=true; 
    break;
  }
  /******************************************************************/
  numCadena= String.valueOf(numEntero);
}
void update(int x, int y) { 
  if (present) {
    if (comprobar.overRect(width/2, height/2-300)) {
      iniciar=true;  
      if (mousePressed && (mouseButton == LEFT)) { 
        reset();
        nivel=1;
      }
    } else if (comprobar.overRect(width/2, height/2-100)) {     
      iniciar2=true;
      if (mousePressed && (mouseButton == LEFT)) { 
        reset();
        numEntero=numEntero+1;
        print(numEntero);
        nivel=2;
      }
    } else if (comprobar.overRect(width/2, height/2+100)) {     
      iniciar3=true;
      if (mousePressed && (mouseButton == LEFT)) {       
        nivel=3; 

        delay(500);
      }
    } else {
      iniciar3=iniciar2=iniciar=false;
    }
  }
}
/******************************************************************/
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
/******************************************************************/
void gane() {
  if (conGanador==true) {
    image(gn, width/2, height/2);
  }
}
void reset() {
  crear=new Creador();
  level=new Niveles();
  imagen=loadImage("made.jpg");
}
