class Niveles extends Puntuacion {  
  Complement trans1, trans2, trans3, trans4, trans5, trans6, trans7; 
  PVector [] vector;
  float [] rotas;
  Forms form;
  color[] fig;
  int figu=1, figuCuad, figuTri; 
  Menu reset;
  //Puntuacion puntos;
  float [] posX;
  float [] posY;
  float [] rot;
  move move;
  JSONObject json, json2;
  JSONArray values;
  /******************************************************************/
  Niveles() {
    posX=new float[7];
    posY=new float[7];
    rot=new float[7];    
    move=new move();    
    figuCuad=2;
    figuTri=3;
    reset=new Menu();
    //puntos=new Puntuacion();
    vector=new PVector[7];
    rotas=new float[7];
    trans1=new Complement();
    trans2=new Complement();
    trans3=new Complement();
    trans4=new Complement();
    trans5=new Complement();
    trans6=new Complement();
    trans7=new Complement();
    form=new Forms();
  } 
  /******************************************************************/
  void crearNivel(color[] ColFig, PImage img, boolean botton ) {  
    background(imagen);
    if (botton) {
      paint.verificador(comprobar.overRect(30, 30), color(254, 255, 0), color(219, 2, 17));   
      form.rectan(30, 30, 40, 40);
    }
    fill(0);
    if (time) {
      time();
    }        
    noStroke();
    /*****************************************************************************************************/
    paint.verificador(comprobar.overRect(trans1.getTransx(), trans1.getTransy()), base, ColFig[0]);   
    trans1.total( comprobar.overRect(trans1.getTransx(), trans1.getTransy()), figuCuad);
    /*****************************************************************************************************/
    paint.verificador( comprobar.overTri(trans2.getTransx(), trans2.getTransy()), base, ColFig[1]);
    trans2.total( comprobar.overTri(trans2.getTransx(), trans2.getTransy()), figuTri);
    /*****************************************************************************************************/
    paint.verificador(comprobar.overTri(trans3.getTransx(), trans3.getTransy()), base, ColFig[2]);
    trans3.total( comprobar.overTri(trans3.getTransx(), trans3.getTransy()), figuTri);
    /*****************************************************************************************************/
    paint.verificador(comprobar.overTri(trans4.getTransx(), trans4.getTransy()), base, ColFig[3]);
    trans4.total( comprobar.overTri(trans4.getTransx(), trans4.getTransy()), figuTri, 75, 37.5);
    /*****************************************************************************************************/
    paint.verificador(comprobar.overTri(trans5.getTransx(), trans5.getTransy()), base, ColFig[4]);
    trans5.total( comprobar.overTri(trans5.getTransx(), trans5.getTransy()), figuTri, 75, 37.5);
    /*****************************************************************************************************/
    paint.verificador(comprobar.overTri(trans6.getTransx(), trans6.getTransy()), base, ColFig[5]);
    trans6.total( comprobar.overTri(trans6.getTransx(), trans6.getTransy()), figuTri, 100, 50);
    /*****************************************************************************************************/
    paint.verificador(comprobar.overQuad(trans7.getTransx(), trans7.getTransy()), base, ColFig[6]);
    trans7.total( comprobar.overQuad(trans7.getTransx(), trans7.getTransy()), figu, 120, 32);
    /*****************************************************************************************************/
    if (keyPressed) {
      if (key == 'g' || key == 'G') {        
        ganador();        
        delay(200);
      }
    }
    gane();
  }
  /*************************************************************************************************************/
  void up(boolean comprobador, Complement trans) {
    if (comprobador) {        
      if (mousePressed && (mouseButton == LEFT)) {
        trans.movimiento=true;
      } else if (mousePressed && (mouseButton == RIGHT)) {
        trans.movimiento=false;
      }
    }
  }
  /********************************************************************************************************************/
  void update() {
    getQaud();
    cargar();
    if (comprobar.overRect(30, 30)) {
      if (mousePressed && (mouseButton == LEFT)) {     
        print(images.size()+"\n");
        nivel=3;
        reset.reset();
      }
    }
    up (comprobar.overRect(trans1.getTransx(), trans1.getTransy()), trans1);
    up(comprobar.overTri(trans2.getTransx(), trans2.getTransy()), trans2);
    up(comprobar.overTri(trans3.getTransx(), trans3.getTransy()), trans3);
    up(comprobar.overTri(trans4.getTransx(), trans4.getTransy()), trans4);
    up(comprobar.overTri(trans5.getTransx(), trans5.getTransy()), trans5);
    up(comprobar.overTri(trans6.getTransx(), trans6.getTransy()), trans6);
    up (comprobar.overQuad(trans7.getTransx(), trans7.getTransy()), trans7);
    if (comprobar.overQuad(trans7.getTransx(), trans7.getTransy())) {
      if (keyPressed) {
        if (key == 'c' || key == 'C') {
          if (figu==1) {
            figu=4;
            delay(200);
          } else if (figu==4) {
            figu=1;
            delay(200);
          }
        }
      }
    }
    savNive();
  }
  /********************************************************************************************************/
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
  /********************************************************************************************************************/
  void gane() {
    if (conGanador==true) {
      imageMode(CENTER);
      image(gn, width/2, height/2);
    }
  }
  /********************************************************************************************************************/
  void savNive() {
    vector[0]=new PVector(trans1.getTransx(), trans1.getTransy());
    vector[1]=new PVector(trans2.getTransx(), trans2.getTransy());
    vector[2]=new PVector(trans3.getTransx(), trans3.getTransy());
    vector[3]=new PVector(trans4.getTransx(), trans4.getTransy());
    vector[4]=new PVector(trans5.getTransx(), trans5.getTransy());
    vector[5]=new PVector(trans6.getTransx(), trans6.getTransy());
    vector[6]=new PVector(trans7.getTransx(), trans7.getTransy()); 
    rotas[0]=trans1.getRot();
    rotas[1]=trans2.getRot();
    rotas[2]=trans3.getRot();
    rotas[3]=trans4.getRot();
    rotas[4]=trans5.getRot();
    rotas[5]=trans6.getRot();
    rotas[6]=trans7.getRot();
    //print(vector[0]+"\n");
  }
  /********************************************************************************************************************/
  void puntajes() {
    if (keyPressed) {
      if (key == 'u' || key == 'U') {          
        numCadena2= String.valueOf(numJson);
        jsonTime();        
        for (int i=0; i<7; i ++) {
          posX[i]=vector[i].x;
          posY[i]=vector[i].y;
          rot[i]=rotas[i];
        }
        values = new JSONArray();
        for (int i = 0; i < posX.length; i++) {
          JSONObject completados = new JSONObject();
          completados.setInt("id", i);
          completados.setFloat("X", posX[i]);
          completados.setFloat("Y", posY[i]);
          completados.setFloat("rot", rot[i]);
          values.setJSONObject(i, completados);
        }
        json = new JSONObject();
        json.setJSONArray("Puntajes", values);
        saveJSONObject(json, "data/new.json"+numCadena2);
        numJson=numJson+1;
        delay(800);
      }
    }
  }
  /********************************************************************************************************************/
  void getQaud() {
    Quad=figu;
  }
  /********************************************************************************************************************/
}
