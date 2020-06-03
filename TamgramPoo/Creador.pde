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
    //reset.reset();
    present=false; 
    update();
    crearNivel(fig, imagen, true);
  }
  /******************************************************************/
  void oneNivel(color[] fig, int nivel) {
    //reset.reset();
    
    present=false; 
    level.update();
    level.crearNivel(fig, images.get(nivel), true);
   
  }
  /******************************************************************/
  void crear() {

    level.update();
    level.crearNivel(fig2, imagen, false);
    paint.verificador(comprobar.overRect(30, 30), color(254, 255, 0), color(219, 2, 17));   
    form.rectan(30, 30, 40, 40);
    if (comprobar.overRect(30, 30)) {
      if (mousePressed && (mouseButton == LEFT)) {     
        print(images.size()+"\n");
        nivel=20;
      }
    }
  }
  /******************************************************************/
  void hecho() {
    if (keyPressed) {
      if (key == 'f' || key == 'F') {
        save("data/Nivel"+numCadena);
        img=loadImage("Nivel"+numCadena+".tif");        
        images.add(img);
        delay(800);
      }
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
        nivel=4;
      }
    }
  }
  void panNivel() {
    background(punt);
    paint.verificador(comprobar.overRect(30, 750), color(254, 255, 0), color(219, 2, 17) );   
    form.rectan(30, 750, 40, 40);
    for (int i =0; i<images.size(); i++) {
      ini=80*(i)+100;     
      crear.levels(ini, fin, i);
    }
    if (comprobar.overRect(30, 750)) {
      if (mousePressed && (mouseButton == LEFT)) {     
        print(images.size()+"\n");
        nivel=20;
      }
    }
  }

}
