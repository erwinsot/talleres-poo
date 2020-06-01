class Creador extends Niveles {
  PImage img;
  PGraphics pg;
  color[]fig2; 
  /******************************************************************/
  Creador() {
    fig2=new color[7];
  }
  /******************************************************************/
  void oneNivel(color[] fig) {
    present=false; 
    level.update();
    level.crearNivel(fig, imagen);
  }
  /******************************************************************/
  void oneNivel(color[] fig, int nivel) {
    present=false; 
    level.update();
    level.crearNivel(fig, images.get(nivel));
  }
/******************************************************************/
  void crear() {
    update();
    crearNivel(fig2, bg);
  }
  /******************************************************************/
  void hecho() {
    if (mousePressed && (mouseButton == RIGHT)) { 
      save("data/Nivel"+numCadena);
      img=loadImage("Nivel"+numCadena+".tif");        
      images.add(img);
      delay(800);
    }
  }
/******************************************************************/
  void levels(float x, float y, int i) {
    paint.verificador(comprobar.overRect(x, y), base, 255);   
    form.rectan(x, y, 40, 40);
    corro(x, y, i);
  }
  /******************************************************************/
  void corro(float x, float y, int i) {  
    if (comprobar.overRect(x, y)) {        
      if (mousePressed && (mouseButton == LEFT)) {        
        print("si");
        imagen=images.get(i);
        nivel=1;
      } else if (move==true) {
        move=false;
      }
    }
  }
}
