class move extends Forms {
  void mover (int fig, float posX, float posY, float rota) {
    pushMatrix();
    translate(posX, posY);
    rotate(rota);
    switch(fig) {
    case 1: 
      shapeQuad(0, 0);
      break;
    case 2:
      rectan(0, 0);
      break;
    case 3:
      shapeTriang(0, 0);
      break;
    case 4:
      shapeQuad2(0, 0);
      break;
    }
    popMatrix();
  }
  /******************************************************************/
  void mover  (int fig, float posX, float posY, float rota, float tamX, float tamY) {
    pushMatrix();
    translate(posX, posY);
    rotate(rota);
    switch(fig) {
    case 1: 
      shapeQuad(0, 0, tamX, tamY);
      break;
    case 2:
      rectan(0, 0, tamX, tamY);
      break;
    case 3:
      shapeTriang(0, 0, tamX, tamY);
      break;
    case 4:
      shapeQuad2(0, 0, tamX, tamY);
      break;
    }
    popMatrix();
  }
}
