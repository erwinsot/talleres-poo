class Complement extends move { 
  float rot;  
  PVector trans;
  Complement() {
    this(random(100, width-100), random(100, height-100), 0 );
  }
  Complement(float x, float y, float r ) {
    trans = new PVector(x, y);
    rot = r;
  }
  void total(boolean move, boolean verificador, int figura ) {
    {
      if (move== true && verificador==true) {    
        if (keyPressed) {
          if (keyCode==UP) {
            rot=rot+0.01;
            delay(10);
            print(rot, "\n");
          }
          if (keyCode==DOWN) {
            rot=rot-0.01;
            delay(10);
          }
        }  
        if (rot!=0) {
          mover(figura, trans.x, trans.y, rot);     
          trans.x=mouseX;
          trans.y=mouseY;
        }
        if (rot==0) {
          trans.x=mouseX;
          trans.y=mouseY;
          switch(figura) {
          case 1: 
            shapeQuad(mouseX, mouseY);
            break;
          case 2:
            rectan(mouseX, mouseY);
            break;
          case 3:
            shapeTriang(mouseX, mouseY);
            break;
          }
        }
      } else {
        if (rot!=0) {          
          mover(figura, trans.x, trans.y, rot);
        } else {
          switch(figura) {
          case 1: 
            shapeQuad(trans.x, trans.y);
            break;
          case 2:
            rectan(trans.x, trans.y);
            break;
          case 3:
            shapeTriang(trans.x, trans.y);
            break;
          }
        }
      }
    }
  }
  void total(boolean move, boolean verificador, int figura, float scaleX, float scaleY  ) {
    {
      if (move== true && verificador==true) {    
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
        if (rot!=0) {
          mover(figura, trans.x, trans.y, rot, scaleX, scaleY);     
          trans.x=mouseX;
          trans.y=mouseY;
        }
        if (rot==0) {
          trans.x=mouseX;
          trans.y=mouseY;
          switch(figura) {
          case 1: 
            shapeQuad(mouseX, mouseY, scaleX, scaleY );
            break;
          case 2:
            rectan(mouseX, mouseY, scaleX, scaleY );
            break;
          case 3:
            shapeTriang(mouseX, mouseY, scaleX, scaleY );
            break;
          }
        }
      } else {
        if (rot!=0) {          
          mover(figura, trans.x, trans.y, rot, scaleX, scaleY );
        } else {
          switch(figura) {
          case 1: 
            shapeQuad(trans.x, trans.y, scaleX, scaleY );
            break;
          case 2:
            rectan(trans.x, trans.y, scaleX, scaleY );
            break;
          case 3:
            shapeTriang(trans.x, trans.y, scaleX, scaleY );
            break;
          }
        }
      }
    }
  }
  float getTransx() {
    return trans.x;
  }
  float getTransy() {
    return trans.y;
  }
}
