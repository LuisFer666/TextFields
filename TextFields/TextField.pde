
public class TextField{
  private float x;
  private float y;
  private float fieldWidth;
  private float fieldHeight;
  private String text;
  
  private int txtSize;
  private color textColor;
  private color bgColor;
  
  private boolean flagCursor;
  private float posXcursor;
  private int posCursor;
  private boolean focus;
  private boolean mouseOver;
  
  public TextField(float x, float y, float newWidth, float newHeight){
    this.x = x;
    this.y = y;
    this.fieldWidth = newWidth;
    this.fieldHeight = newHeight;
    initCursorSettings();
    text = "";
    bgColor = color(255);
    textColor = color(0);
    txtSize=0;
    textSize(newHeight-5);
  }
  
  private void initCursorSettings(){
    posXcursor = x+5;
    posCursor = 0;
    flagCursor = false;
    focus = false;
    mouseOver = false;
  }
  
  private void drawCursor(){
    if(focus){
      // Controlar cuando parpadea
      if(frameCount%30 == 0){
        flagCursor = !flagCursor;
      }
      // Dibujar efecto de parpadear
      if(flagCursor){
        // Color del cursor
        fill(0);
        line(posXcursor, this.y+3, posXcursor, this.y+this.fieldHeight-3);
      }
    }
  }
  
  public void setText(String text){
    this.text = text;
  }
  
  public String getText(){
    return this.text;
  }
  
  public void setTextSize(int newTxtSize){
    this.txtSize = newTxtSize;
  }
  
  public int getTextSize(){
    return txtSize;
  }
  
  public void setBgColor(color newBgColor){
    this.bgColor = newBgColor;
  }
  
  public color getBgColor(){
    return this.bgColor;
  }
  
  public void setTextColor(color newTextColor){
    this.textColor = newTextColor;
  }
  
  public color getTextColor(){
    return this.textColor;
  }
  
  public void draw(){
    fill(bgColor); // Definir color de fondo
    rect(x, y, fieldWidth, fieldHeight); // Dibujar campo de texto
    drawCursor(); // Dibujar cursor
    fill(textColor); // Definir color del texto
    text(text, x+5, y, this.fieldWidth, this.fieldHeight); // Dibujar texto
  }
  
  public void mouseMoved(){
    if(mouseX >= this.x && mouseX <= (this.fieldWidth + this.x) && mouseY >= this.y && mouseY <= (this.fieldHeight + this.y)){
      cursor(TEXT);
      mouseOver = true;
    }else{
      cursor(ARROW);
      mouseOver = false;
    }
  }
  
  public void mouseClicked(){
    if(mouseOver){
      focus = true;
    }else{
      focus = false;
    }
  }
  
  public void keyPressed(){
    txtSize = text.length();
    if(focus && posXcursor < this.x+this.fieldWidth-5){
      if(keyCode == BACKSPACE){ // Borrar
        if(posCursor > 0){
          text = text.substring(0, posCursor-1) + text.substring(posCursor, txtSize);
          txtSize = text.length();
          posCursor--;
          posXcursor = (float)x+5+textWidth(text)-textWidth(text.substring(posCursor, txtSize));
        }
      }else if(keyCode == LEFT){
        if(posCursor > 0){
          posCursor--;
          posXcursor = (float)x+5+textWidth(text)-textWidth(text.substring(posCursor, txtSize));
        }
      }else if(keyCode == RIGHT){
        if(posCursor < txtSize){
          posCursor++;
          posXcursor = (float)x+5+textWidth(text)-textWidth(text.substring(posCursor, txtSize));
        }
      }else if(keyCode == 127){ // Suprimir
        if(posCursor < txtSize){
          text = text.substring(0, posCursor) + text.substring(posCursor+1, txtSize);
          txtSize = text.length();
          posXcursor = (float)x+5+textWidth(text)-textWidth(text.substring(posCursor, txtSize));
        }
      }else if(keyCode == 36){ // Tecla inicio
        posXcursor = (float)x+5;
        posCursor=0;
      }else if(keyCode == 35){ // Tecla fin
        posXcursor = (float)x+5+textWidth(text);
        posCursor=txtSize;
      }else if(keyCode != 16        && keyCode != 20 && keyCode != 524 && 
               keyCode != ENTER     && keyCode != 17 && keyCode != 161 &&
               keyCode != SHIFT     && keyCode != 18 && keyCode != 129 && keyCode!=9){
        String izq = text.substring(0, posCursor);
        String der = text.substring(posCursor, txtSize);
        text = izq + key + der;
        txtSize = text.length();
        if(posCursor < txtSize){
          posCursor++;
        }
        posXcursor = (float)x+5+textWidth(text)-textWidth(text.substring(posCursor, txtSize));
      }
    }
  }
}
