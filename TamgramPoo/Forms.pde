class Forms {
  PShape triang, cuadra, u, w, p, quad;
  void shapeQuad(int posX, int posY) {
    quad=createShape();
    quad.beginShape();
    quad.noStroke();
    quad.vertex(-150, -50);
    quad.vertex(-50, 50);
    quad.vertex(200, 50);
    quad.vertex(100, -50);  
    quad.endShape(CLOSE);
    shape(quad, posX, posY);
  }
  void shapeQuad(int posX, int posY, float sizeX, float sizeY) {
    quad=createShape();
    quad.beginShape();
    quad.noStroke();
    quad.vertex(-150, -50);
    quad.vertex(-50, 50);
    quad.vertex(200, 50);
    quad.vertex(100, -50);  
    quad.endShape(CLOSE);
    shape(quad, posX, posY, sizeX, sizeY);
  }
  void shapeCuadra(int posX, int posY) {
    cuadra= createShape();
    cuadra.beginShape();
    cuadra.noStroke();
    cuadra.vertex(-50, -50);
    cuadra.vertex(-50, 50);
    cuadra.vertex(50, 50);
    cuadra.vertex(50, -50);  
    cuadra.endShape(CLOSE);
    shape(cuadra, posX, posY);
  }
  void shapeCuadra(int posX, int posY, float sizeX, float sizeY) {
    cuadra=createShape();
    cuadra.beginShape();
    cuadra.noStroke();
    cuadra.vertex(-50, -50);
    cuadra.vertex(-50, 50);
    cuadra.vertex(50, 50);
    cuadra.vertex(50, -50);  
    cuadra.endShape(CLOSE);
    shape(cuadra, posX, posY, sizeX, sizeY);
  }
  void shapeTriang(float posX, float posY) {
    triang=createShape();
    triang.beginShape();  
    triang.noStroke();
    triang.vertex(-150, 110-(110/3));
    triang.vertex(0, -110+(110/3));
    triang.vertex(150, 110-(110/3));  
    triang.endShape(CLOSE);
    shape(triang, posX, posY);
  }
  void shapeTriang(int posX, int posY, float sizeX, float sizeY) {
    triang = createShape();
    triang.beginShape();  
    triang.noStroke();
    triang.vertex(-150, 110-(110/3));
    triang.vertex(0, -110+(110/3));
    triang.vertex(150, 110-(110/3));  
    triang.endShape(CLOSE);
    shape(triang, posX, posY, sizeX, sizeY);
  }
}
