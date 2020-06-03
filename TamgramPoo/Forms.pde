class Forms {
  PShape triang, u, w, p, quad;
  float cenxTri, cenyTri, bariX, bariY;
  PVector vert1, vert2, vert3, vert4;
  PVector triVert1, triVert2, triVert3;
  /******************************************************************/
  Forms() {
    vert1=new PVector(-150, -50);
    vert2=new PVector(-50, 50);
    vert3=new PVector(200, 50);
    vert4=new PVector(100, -50);
    triVert1=new PVector(-150, 110);
    triVert2=new PVector(0, -110);
    triVert3=new PVector(150, 110);
    cenxTri=(vert1.x+vert2.x+vert3.x+vert4.x)/4;
    cenyTri=(vert1.y+vert2.y+vert3.y+vert4.y)/4;
    bariX=(triVert1.x+triVert2.x+triVert3.x)/3;
    bariY=(triVert1.y+triVert2.y+triVert3.y)/3;
  }
  /******************************************************************/
  void shapeQuad(float posX, float posY) {
    quad=createShape();
    quad.beginShape();
    quad.noStroke();
    quad.vertex(vert1.x, vert1.y);
    quad.vertex(vert2.x, vert2.y);
    quad.vertex(vert3.x, vert3.y);
    quad.vertex(vert4.x, vert4.y);  
    quad.endShape(CLOSE);
    shape(quad, posX, posY);
  }
  /******************************************************************/
  void shapeQuad2(float posX, float posY) {
    quad=createShape();
    quad.beginShape();
    quad.noStroke();
    quad.vertex(-50, -50);
    quad.vertex(-150, 50);
    quad.vertex(100, 50);
    quad.vertex(200, -50);  
    quad.endShape(CLOSE);
    shape(quad, posX, posY);
  }
  /******************************************************************/
  void shapeQuad2(float posX, float posY, float sizeX, float sizeY) {
    quad=createShape();
    quad.beginShape();
    quad.noStroke();
    quad.vertex(-50, -50);
    quad.vertex(-150, 50);
    quad.vertex(100, 50);
    quad.vertex(200, -50);  
    quad.endShape(CLOSE);
    shape(quad, posX, posY, sizeX, sizeY);
  }
  /******************************************************************/
  void shapeQuad(float posX, float posY, float sizeX, float sizeY) {
    quad=createShape();
    quad.beginShape();
    quad.noStroke();
    quad.vertex(vert1.x, vert1.y);
    quad.vertex(vert2.x, vert2.y);
    quad.vertex(vert3.x, vert3.y);
    quad.vertex(vert4.x, vert4.y);   
    quad.endShape(CLOSE);
    shape(quad, posX, posY, sizeX, sizeY);
  }
  /******************************************************************/
  void rectan(float x, float y) {
    rectMode(CENTER);
    rect(x, y, 100, 100);
  }
  void rectan(float x, float y, float sizeX, float sizeY) {
    rectMode(CENTER);
    rect(x, y, sizeX, sizeY);
  }
  /******************************************************************/
  void shapeTriang(float posX, float posY) {
    triang=createShape();
    triang.beginShape();  
    triang.noStroke();
    triang.vertex(triVert1.x, triVert1.y-(bariY));
    triang.vertex(triVert2.x, triVert2.y+(bariY));
    triang.vertex(triVert3.x, triVert3.y-(bariY));  
    triang.endShape(CLOSE);
    shape(triang, posX, posY);
  }
  /******************************************************************/
  void shapeTriang(float posX, float posY, float sizeX, float sizeY) {
    triang = createShape();
    triang.beginShape();  
    triang.noStroke();
    triang.vertex(triVert1.x, triVert1.y-(bariY));
    triang.vertex(triVert2.x, triVert2.y+(bariY));
    triang.vertex(triVert3.x, triVert3.y-(bariY));  
    triang.endShape(CLOSE);
    shape(triang, posX, posY, sizeX, sizeY);
  }
  /******************************************************************/
  float getCentx() {
    return cenxTri;
  } 
  float getCenty() {
    return cenyTri;
  } 
  float getVert1x() {
    return vert1.x;
  }
  float getVert1y() {
    return vert1.y;
  }
  float getBarix() {
    return bariX;
  }
  float getBariy() {
    return bariY;
  }
  float gettriVert1x() {
    return triVert3.x;
  }
  float gettriVert1y() {
    return triVert3.y;
  }
}
