class Complement extends move { 
  float rot;  
  PVector trans;
  boolean movimiento;
  Complement() {
    this(random(100, width-100), random(100, height-100), random(2, 360) );
  }

  Complement(float x, float y, float r ) {
    trans = new PVector(x, y);
    rot = r;
  }
  /******************************************************************/
  void total( boolean verificador, int figura ) {    
    if (movimiento== true && verificador==true) {    
      if (keyPressed) {
        if (keyCode==UP) {
          rot=rot+0.01;
          delay(10);
        }
        if (keyCode==DOWN) {
          rot=rot-0.01;
          delay(10);
        }
      }  
      mover(figura, trans.x, trans.y, rot);     
      trans.x=mouseX;
      trans.y=mouseY;
    } else {
      mover(figura, trans.x, trans.y, rot);
    }
  }
  /******************************************************************/
  void total( boolean verificador, int figura, float scaleX, float scaleY ) {    
    if (movimiento== true && verificador==true) {    
      if (keyPressed) {
        if (keyCode==UP) {
          rot=rot+0.01;
          delay(10);
        }
        if (keyCode==DOWN) {
          rot=rot-0.01;
          delay(10);
        }
      }  
      mover(figura, trans.x, trans.y, rot, scaleX, scaleY);     
      trans.x=mouseX;
      trans.y=mouseY;
    } else {
      mover(figura, trans.x, trans.y, rot, scaleX, scaleY);
    }
  } 
  /******************************************************************/
  PVector ss() {
    return trans;
  }
  float getRot() {
    return rot;
  }
  boolean getMovi() {
    return movimiento;
  }
  float getTransx() {
    return trans.x;
  }
  float getTransy() {
    return trans.y;
  }
}
