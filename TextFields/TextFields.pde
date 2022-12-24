TextField txtFunction;

String funcion;

void setup() {
  size(800, 600);
  background (255);
  
  txtFunction = new TextField(20, 20, 400, 20);
}


void draw() {
  background(255);
  txtFunction.draw();
}

void keyPressed() {
  txtFunction.keyPressed();
}

void mouseMoved(){
  txtFunction.mouseMoved();
}

void mouseClicked(){
  txtFunction.mouseClicked();
}
