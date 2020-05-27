class Comprov {
  boolean overQuad(float quCenx, float quCeny, float x, float y,float posX,float posY ) {
    float disX = posX - mouseX;
    float disY = posY - mouseY;
    float disX1 =quCenx-x;
    float disY1 =quCeny-y;  
    if (sqrt(sq(disX) + sq(disY))< sqrt(sq(disX1) + sq(disY1))-100) {    
      return true;
    } else {
      return false;
    }
  }
  boolean overTri(float bariX, float bariY, float x, float y, float po9, float po10 ) {
    float disX = po9 - mouseX;
    float disY = po10 - mouseY;
    float disX1 = bariX-x;
    float disY1 =bariY-y;  
    if (sqrt(sq(disX) + sq(disY))< sqrt(sq(disX1) + sq(disY1))-100) {    
      return true;
    } else {
      return false;
    }
  }
  boolean overRect(int x, int y, int ancho, int alto) {
    if ((mouseX <= x && mouseX >= x-ancho/2  && (mouseY <= y && mouseY >= y-alto/2 ||
      mouseY>=y && mouseY<=y+alto/2)) || (mouseX>=x  && mouseX <= x+ancho/2 && (mouseY <= y &&
      mouseY>=y-alto/2 || mouseY>=y && mouseY<y+alto/2)) ) {
      return true;
    } else {
      return false;
    }
  }
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
