# TextFields
Simulation of TextFields in Processing

<img src="https://i.imgur.com/hiN0G8f.png"/>

You can create useful text fields in your Processing programs with several features

## Features

1. Focus gain and focus lost
2. Blinking cursor
3. Type text in text field from keyboard
4. Erase text using DEL or SUPR buttons
5. Move cursor for typing or erase between characters
6. Change text size
7. Change field background color

## Constructor

* TextField(x, y, width, height): Create a textfield that starts in (x, y) coordinate and with a specific width and height

## Functions

* void setText(String): Change textfield text from code
* String getText(): Get textfield text from code
* void setTextSize(int): Change textfield text size from code
* int getTextSize(): Get textfield text size from code
* void setBgColor(color): Change background field color from code
* color getBgColor(): Get backgraund field color from code
* void setTextColor(color): Change textfield text color from code
* color getTextColor(): Get textfield text color from code

## Usage

You need to instance an object from TextField class and add calls from each function in Main processing file as its shown below

```java
TextField textField;

void setup() {
    ...
    textField = new TextField(20, 20, 400, 20);
}


void draw() {
    ...
    textField.draw();
}

void keyPressed() {
    ...
    textField.keyPressed();
}

void mouseMoved(){
    ...
    textField.mouseMoved();
}

void mouseClicked(){
    ...
    textField.mouseClicked();
}
```
