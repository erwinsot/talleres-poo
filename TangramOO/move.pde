
class move extends Forms {
  void mover (int fig, float posX, float posY,float rota) {
    pushMatrix();
    translate(posX, posY);
    rotate(rota);
    switch(fig) {
    case 1: 
      shapeQuad(0, 0);
      break;
    case 2:
      shapeCuadra(0, 0);
      break;
    case 3:
      shapeTriang(0, 0);
      break;
    }
    popMatrix();
  }
  void mover  (int fig, float posX, float posY, float tamX, float tamY) {
    pushMatrix();
    translate(posX, posY);
    rotate(rota);
    switch(fig) {
    case 1: 
      shapeQuad(0, 0, tamX, tamY);
      break;
    case 2:
      shapeCuadra(0, 0, tamX, tamY);
      break;
    case 3:
      shapeTriang(0, 0, tamX, tamY);
      break;
    }
    popMatrix();
  }
}
