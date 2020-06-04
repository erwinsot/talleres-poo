class Niveles extends Puntuacion {  
  Complement trans1, trans2, trans3, trans4, trans5, trans6, trans7; 
  boolean quadOver,triOver5,triOver4,triOver3,triOver2,triOver1,rectOver;
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
    quadOver=triOver5=triOver4=triOver3=triOver2=triOver1= rectOver= false;
    posX=new float[7];
    posY=new float[7];
    rot=new float[7];    
    move=new move();    
    figuCuad=2;
    figuTri=3;
    reset=new Menu();    
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
    
    paint.verificador(rectOver, base, ColFig[0]);   
    trans1.total( rectOver, figuCuad);
    /*****************************************************************************************************/
    paint.verificador( triOver1, base, ColFig[1]);
    trans2.total( triOver1, figuTri);
    /*****************************************************************************************************/
    paint.verificador(triOver2, base, ColFig[2]);
    trans3.total( triOver2, figuTri);
    /*****************************************************************************************************/
    paint.verificador(triOver3, base, ColFig[3]);
    trans4.total( triOver3, figuTri, 75, 37.5);
    /*****************************************************************************************************/
    paint.verificador(triOver4, base, ColFig[4]);
    trans5.total( triOver4, figuTri, 75, 37.5);
    /*****************************************************************************************************/
    paint.verificador(triOver5, base, ColFig[5]);
    trans6.total(triOver5, figuTri, 100, 50);
    /*****************************************************************************************************/
    paint.verificador(quadOver, base, ColFig[6]);
    trans7.total( quadOver, figu, 120, 32);
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
    update2();
    getQaud();
    cargar();
    if (comprobar.overRect(30, 30)) {
      if (mousePressed && (mouseButton == LEFT)) {       
        nivel=3;
        conGanador=false;
        reset.reset();
      }
    }
    up (rectOver, trans1);
    up(triOver1, trans2);
    up(triOver2, trans3);
    up(triOver3, trans4);
    up(triOver4, trans5);
    up(triOver5, trans6);
    up (quadOver, trans7);
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
  void update2() {
   if ( comprobar.overRect(trans1.getTransx(), trans1.getTransy()) ) {
    rectOver = true;
    quadOver=triOver1=triOver2=triOver3=triOver4=triOver5=false;    
  }
  else if ( comprobar.overTri(trans2.getTransx(), trans2.getTransy()) ) {   
    triOver1=true;
    quadOver=rectOver=triOver2=triOver3=triOver4=triOver5=false;
  }
  else if ( comprobar.overTri(trans3.getTransx(), trans3.getTransy()) ) {    
    triOver2=true;
    quadOver=rectOver=triOver1=triOver3=triOver4=triOver5=false;
  }
  else if ( comprobar.overTri(trans4.getTransx(), trans4.getTransy())) {  
    triOver3=true;
    quadOver=rectOver=triOver2=triOver1=triOver4=triOver5=false;
  }
  else if ( comprobar.overTri(trans5.getTransx(), trans5.getTransy()) ) {    
    triOver4=true;
    quadOver=rectOver=triOver2=triOver3=triOver1=triOver5=false;
  }
  else if ( comprobar.overTri(trans6.getTransx(), trans6.getTransy()) ) {    
    triOver5=true;
    quadOver=rectOver=triOver2=triOver3=triOver4=triOver1=false;
  }  
  else if (comprobar.overQuad(trans7.getTransx(), trans7.getTransy())){
    quadOver=true;
    triOver5=rectOver=triOver2=triOver3=triOver4=triOver1=false;
  }  
  else {
    quadOver=triOver5=triOver4=triOver3=triOver2=triOver1= rectOver = false;
  }
}
}
