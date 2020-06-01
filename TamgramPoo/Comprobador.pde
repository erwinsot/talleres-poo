Forms atributo=new Forms();
class Comprobador {
  float quCenx, quCeny;  
  float distQuadx, distQuady, disTrix, disTriy;  
  float bariX, bariY;
  float ancho, alto;
  Comprobador() {
    ancho=100;
    alto=100;
    quCenx=atributo.getCentx();
    quCeny=atributo.getCenty();
    distQuadx=atributo.getVert1x();
    distQuady=atributo.getVert1y();
    disTrix=atributo.gettriVert1x();
    disTriy=atributo.gettriVert1y();
    bariX=atributo.getBarix();
    bariY=atributo.getBariy();
  }
  /******************************************************************/
  boolean overQuad( float posX, float posY ) {
    float disX = posX - mouseX;
    float disY = posY - mouseY;
    float disX1 =quCenx-distQuadx;
    float disY1 =quCeny-distQuady;  
    if (sqrt(sq(disX) + sq(disY))< sqrt(sq(disX1) + sq(disY1))-100) {    
      return true;
    } else {
      return false;
    }
  }
  /******************************************************************/
  boolean overTri( float po9, float po10 ) {
    float disX = po9 - mouseX;
    float disY = po10 - mouseY;
    float disX1 =bariX-disTrix;
    float disY1 =bariY-disTriy;  
    if (sqrt(sq(disX) + sq(disY))< sqrt(sq(disX1) + sq(disY1))-100) {    
      return true;
    } else {
      return false;
    }
  }
  /******************************************************************/
  boolean overRect(float x, float y ) {
    if ((mouseX <= x && mouseX >= x-ancho/2  && (mouseY <= y && mouseY >= y-alto/2 ||
      mouseY>=y && mouseY<=y+alto/2)) || (mouseX>=x  && mouseX <= x+ancho/2 && (mouseY <= y &&
      mouseY>=y-alto/2 || mouseY>=y && mouseY<y+alto/2)) ) {
      return true;
    } else {
      return false;
    }
  }
  /******************************************************************/
  boolean overCircle(int x, int y, int diameter) {
    float disX = x - mouseX;
    float disY = y - mouseY;
    if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
      return true;
    } else {
      return false;
    }
  }
}
