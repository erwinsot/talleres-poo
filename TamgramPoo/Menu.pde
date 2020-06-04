class Menu { 
  color baseBotton;
  Menu () {
    baseBotton=color(86, 90, 78);
  }
  void crearMenu() { 
    paint.verificador(comprobar.overRect(width/2, height/2-300), baseBotton, color(65, 214, 205));
    forma.rectan(width/2, height/2-300, 300, 50);
    crearTe("PUNTUACION", width/2, height/2-290);
    //************************************************************************
    paint.verificador(comprobar.overRect(width/2, height/2-100), baseBotton, color(237, 215, 45));
    forma.rectan(width/2, height/2-100, 300, 50);
    crearTe("MODE CREATOR", width/2, height/2-90);
    //****************************************************************************
    paint.verificador(comprobar.overRect(width/2, height/2+100), baseBotton, color(125, 254, 120));
    forma.rectan(width/2, height/2+100, 300, 50);
    crearTe("NIVELES", width/2, height/2+110);
    //******************************************************************************
    paint.verificador(comprobar.overRect(width/2, height/2+300), baseBotton, color(237, 7, 142));
    forma.rectan(width/2, height/2+300, 300, 50);
    crearTe("EXIT", width/2, height/2+310);
  }
  void update(int x, int y) { 
    if (present) {
      if (comprobar.overRect(width/2, height/2-300)) {         
        if (mousePressed && (mouseButton == LEFT)) {
          time=false;
          reset();
          nivel=1;
        }
      } else if (comprobar.overRect(width/2, height/2-100)) {
        if (mousePressed && (mouseButton == LEFT)) {
          time=false;
          reset();
          numEntero=numEntero+1;          
          nivel=2;
        }
      } else if (comprobar.overRect(width/2, height/2+100)) {        
        if (mousePressed && (mouseButton == LEFT)) {
          time=true;
          nivel=3;
          delay(500);
        }
      } else if (comprobar.overRect(width/2, height/2+300)) {         
        if (mousePressed && (mouseButton == LEFT)) {           
          exit();
        }
      }
    }
  }
  /******************************************************************/
  void crearTe(String pal, float x, float y ) {
    textSize(32);
    textAlign(CENTER);  
    fill(0, 102, 153);
    text(pal, x, y);
  }

  void reset() {
    s=m=h=mili=0;
    crear=new Creador();
    level=new Niveles();
    imagen=loadImage("made.jpg");
  }
}
