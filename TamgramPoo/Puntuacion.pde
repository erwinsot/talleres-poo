abstract class Puntuacion {
  float [] posX;
  float [] posY;
  float [] rot;
  Forms form;
  move move;
  JSONObject json, json2;
  JSONArray values;
  Puntuacion () { 
    posX=new float[7];
    posY=new float[7];
    rot=new float[7];    
    move=new move();
    form=new Forms();
  }
  abstract void puntajes();   
  /********************************************************************************************************************/
  void cargPunt() {
    background(muestra);
    paint.verificador(comprobar.overRect(30, 750), color(254, 255, 0), color(219, 2, 17) );   
    form.rectan(30, 750, 40, 40);
    for (int i =0; i<numJson; i++) {
      ini=80*(i)+100;     
      points(ini, fin, i);
    }
    if (comprobar.overRect(30, 750)) {
      if (mousePressed && (mouseButton == LEFT)) {         
        nivel=20;
      }
    }
  }
  /********************************************************************************************************************/
  void points(float x, float y, int i) {
    paint.verificador(comprobar.overRect(x, y), base, 255);   
    form.rectan(x, y, 40, 40);
    points2(x, y, i);
  }
  /********************************************************************************************************************/
  void points2(float x, float y, int i) {  
    if (comprobar.overRect(x, y)) {        
      if (mousePressed && (mouseButton == LEFT)) {        
        maxpoin=i;
        nivel=5;
      }
    }
  }
  /********************************************************************************************************************/
  void mostPunt(int a, int figu) {
    paint.verificador(comprobar.overRect(30, 750), color(254, 255, 0), color(219, 2, 17) );   
    form.rectan(30, 750, 40, 40);
    if (comprobar.overRect(30, 750)) {
      if (mousePressed && (mouseButton == LEFT)) {        
        nivel=5;
      }
    }
    String val= String.valueOf(a);
    background(imagen);
    json = loadJSONObject("new.json"+val);
    json2= loadJSONObject("new.jsonn"+val);
    int segundos=json2.getInt("segundos");
    int minutos=json2.getInt("minutos");
    JSONArray values = json.getJSONArray("Puntajes");
    for (int i = 0; i < values.size(); i++) { 
      int sa=i;
      int fi=i;
      if (sa==0) {
        sa=2;
      } else if (sa==6) {
        sa=figu;
      } else {
        sa=3;
      }
      JSONObject score = values.getJSONObject(i);      
      float xpos = score.getFloat("X");
      float ypos = score.getFloat("Y");
      float rotati = score.getFloat("rot");
      if (fi==3 || fi==4) {
        move.mover(sa, xpos, ypos, rotati, 75, 37.5 );
      } else if (fi==5) {
        move.mover(sa, xpos, ypos, rotati, 100, 50);
      } else if (fi==6) {
        move.mover(sa, xpos, ypos, rotati, 120, 32);
      } else {
        move.mover(sa, xpos, ypos, rotati);
      }
    }    
    textSize(30);
    textAlign(CENTER);  
    fill(random(255), random(255), random(255));
    text("Nivel completado en"+" "+minutos+" MINUTOS "+segundos+" SEGUNDOS ", width/2, 700);
  }
  /********************************************************************************************************************/
  void cargar() {
    if (conGanador==true) {      
      puntajes();
    }
  }
  /********************************************************************************************************************/
  void jsonTime() {
    json2 = new JSONObject();
    json2.setInt("id", 0);
    json2.setInt("segundos", m );
    json2.setInt("minutos", h);
    saveJSONObject(json2, "data/new.jsonn"+numCadena2);
  }
  /********************************************************************************************************************/
  void time() {
    if (mili<=1000) {
      s=s+1;
    }
    if (s<=59) {
      fill(0, 102, 153);
      text(h+":"+m, 700, 50);
    } else if (m<=59) {
      m=m+1;
      s=0;
    } else {
      m=0;
      s=0;
      h=h+1;
    }
  }
  /********************************************************************************************************************/
}
