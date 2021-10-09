import oscP5.*;
import netP5.*;
OscP5 oscP5;
NetAddress myRemoteLocation;
OscMessage myMessage;
void setup() {
  size(400, 400);
  frameRate(12);
  surface.setResizable(true);
  oscP5 = new OscP5(this, 8000);
  myRemoteLocation = new NetAddress("192.168.0.13", 12000);
}
void draw() {
  background(0);
  sendOSC(mouseX+random(-3, 3));
}
void sendOSC(float value) {
  for (int i = 0; i < 8; i++) {
    float nValue;
    if (i == 0) {
      myMessage = new OscMessage("/wimumo001/emg/ch1");
      nValue = noise(value);
      myMessage.add(abs(nValue*1E4));
    } else if (i == 1) {
      myMessage = new OscMessage("/wimumo001/emg/ch2");
      nValue = noise(value, 20);
      myMessage.add(abs(nValue*1E4));
    } else if (i == 2) {
      myMessage = new OscMessage("/wimumo001/emg/ch3");
      nValue = tan(value);
      myMessage.add(abs(nValue*1E4));
    } else if (i == 3) {
      myMessage = new OscMessage("/wimumo001/emg/ch4");
      nValue = cos(value);
      myMessage.add(abs(nValue*1E4));
    } else if (i == 4) {
      myMessage = new OscMessage("/wimumo001/emg/ch5");
      nValue = cos(value);
      myMessage.add(abs(nValue*1E4));
    } else if (i == 5) {
      myMessage = new OscMessage("/wimumo001/emg/ch6");
      nValue = sin(value);
      myMessage.add(abs(nValue*1E4));
    } else if (i == 6) {
      myMessage = new OscMessage("/wimumo001/emg/ch7");
      nValue = mouseX*10;
      myMessage.add(abs(nValue));
    } else if (i == 7) {
      myMessage = new OscMessage("/wimumo001/emg/ch8");
      nValue = mouseY*10;
      myMessage.add(abs(nValue));
    }

    oscP5.send(myMessage, myRemoteLocation);
  }
}
