//Ejemplo simplificado de Andreas Schlegel 
//http://www.sojamo.de/libraries/oscP5/
import oscP5.*;
import netP5.*;
OscP5 oscP5;
NetAddress ipRemoto;
void setup() {
  frameRate(12);
  oscP5 = new OscP5(this,12000);
  ipRemoto = new NetAddress("127.0.0.1",12000);
}
void draw() {}
void mouseMoved() {
  OscMessage myMessage = new OscMessage("/test");
  myMessage.add(mouseX, mouseX, mouseY, mouseY);
  oscP5.send(myMessage, ipRemoto); 
}
