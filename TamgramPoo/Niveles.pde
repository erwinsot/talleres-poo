class Niveles {
  boolean move, move1, move2, move3, move4, move5, move6;
  boolean rectOver, triOver, triOver2, triOver3, triOver4, triOver5, quadOver, retroceder;
  Complement trans1, trans2, trans3, trans4, trans5, trans6, trans7;
  Forms form;
  color[] fig;
  int figu=1;
  Niveles()
  /******************************************************************/
  {
    rectOver=triOver= triOver2= triOver3=triOver4=triOver5= quadOver=false;
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
  void crearNivel(color[] ColFig, PImage img ) {  
    background(imagen);
    paint.verificador(retroceder, base, 255);   
    form.rectan(30, 30, 40, 40);
    fill(0);    
    //square(width/2, height/2, 301);    
    noStroke();
    //////////////////////////////rectangulo/////////////////////////////////////////////////////////  
    paint.verificador(rectOver, base, ColFig[0]);   
    trans1.total(move, rectOver, 2);
    //////////////////////////////////////triangulo1/////////////////////////////////////////////////
    paint.verificador(triOver, base, ColFig[1]);
    trans2.total(move1, triOver, 3);
    /////////////////////////////////triangulo2/////////////////////////////////////////////////////    
    paint.verificador(triOver2, base, ColFig[2]);
    trans3.total(move2, triOver2, 3);
    ////////////////////////////trriangulo 3///////////////////////////////////////////////////////
    paint.verificador(triOver3, base, ColFig[3]);
    trans4.total(move3, triOver3, 3, 75, 37.5);
    ////////////////////////////////triangulo4/////////////////////////////////////////////////////
    paint.verificador(triOver4, base, ColFig[4]);
    trans5.total(move4, triOver4, 3, 75, 37.5);
    //////////////////////////////////////////triangulo 5/////////////////////////////////////////
    paint.verificador(triOver5, base, ColFig[5]);
    trans6.total(move5, triOver5, 3, 100, 50);
    //////////////////////////////////////////////////quad////////////////////////////////////////
    paint.verificador(quadOver, base, ColFig[6]);
    trans7.total(move6, quadOver, figu, 120, 32);
    //////////////////////////////////////////////////////////////////////////////////////////////  
    if (keyPressed) {
      if (key == 'g' || key == 'G') {
        ganador();
        delay(200);
      }
    }
    gane();
  }
  /******************************************************************/
  void update() {
    if (comprobar.overRect(30, 30)) {
      retroceder=true;
      if (mousePressed && (mouseButton == LEFT)) {     
        print(images.size()+"\n");
        nivel=20;
      } else if (move==true) {
        move=false;
      }
    } else if ( comprobar.overRect(trans1.getTransx(), trans1.getTransy()) ) {    
      rectOver = true;
      if (mousePressed && (mouseButton == LEFT)) {
        if (move==false) {
          move=true;
        } else if (move==true) {
          move=false;
        }
      }  
      quadOver=triOver=triOver2=triOver3=triOver4=triOver5=false;
    } else if ( comprobar.overTri(trans2.getTransx(), trans2.getTransy()) ) {   
      triOver=true;
      if (mousePressed && (mouseButton == LEFT)) {
        if (move1==false) {
          move1=true;
        } else if (move1==true) {
          move1=false;
        }
      }
      quadOver=rectOver=triOver2=triOver3=triOver4=triOver5=false;
    } else if ( comprobar.overTri(trans3.getTransx(), trans3.getTransy()) ) {    
      triOver2=true;
      if (mousePressed && (mouseButton == LEFT)) {
        if (move2==false) {
          move2=true;
        } else if (move2==true) {
          move2=false;
        }
      }
      quadOver=rectOver=triOver=triOver3=triOver4=triOver5=false;
    } else if ( comprobar.overTri(trans4.getTransx(), trans4.getTransy())) {  
      triOver3=true;
      if (mousePressed && (mouseButton == LEFT)) {
        if (move3==false) {
          move3=true;
        } else if (move3==true) {
          move3=false;
        }
      }
      quadOver=rectOver=triOver2=triOver=triOver4=triOver5=false;
    } else if ( comprobar.overTri(trans5.getTransx(), trans5.getTransy())) {    
      triOver4=true;
      if (mousePressed && (mouseButton == LEFT)) {
        if (move4==false) {
          move4=true;
        } else if (move4==true) {
          move4=false;
        }
      }
      quadOver=rectOver=triOver2=triOver3=triOver=triOver5=false;
    } else if (comprobar.overTri(trans6.getTransx(), trans6.getTransy())) {   
      triOver5=true;
      if (mousePressed && (mouseButton == LEFT)) {
        if (move5==false) {
          move5=true;
        } else if (move5==true) {
          move5=false;
        }
      }
      quadOver=rectOver=triOver2=triOver3=triOver4=triOver=false;
    } else if (comprobar.overQuad(trans7.getTransx(), trans7.getTransy())) {
      quadOver=true;
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
      if (mousePressed && (mouseButton == LEFT)) {
        if (move6==false) {
          move6=true;
        } else if (move6==true) {
          move6=false;
        }
      }
      triOver5=rectOver=triOver2=triOver3=triOver4=triOver=false;
    } else {
      quadOver=triOver5=triOver4=triOver3=triOver2=triOver=rectOver=iniciar=retroceder= false;
    }
  }
}
