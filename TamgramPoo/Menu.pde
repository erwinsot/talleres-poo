class Menu {
  void crearMenu() { 
    paint.verificador(iniciar, base, 255);
    forma.rectan(width/2, height/2-300, 200, 50);
    //************************************************************************
    paint.verificador(iniciar2, base, 126);
    forma.rectan(width/2, height/2-100, 200, 50);
    //****************************************************************************
    paint.verificador(iniciar3, base, color(125, 254, 120));
    forma.rectan(width/2, height/2+100, 200, 50);
    //******************************************************************************
    paint.verificador(iniciar, base, 255);
    forma.rectan(width/2, height/2+300, 200, 50);
  }
}
