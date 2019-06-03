public class Spinner extends Thing {
  float startTime, angle, oldAngle;
  PImage spinnerPhoto;
  
  Spinner(float startTime) {
    super(width / 2, height / 2);
    this.startTime = startTime;
    this.spinnerPhoto = loadImage("Images/spinner-circle@2x.png");
    
    angle = processAngle(mouseX, mouseY);
    oldAngle = 0;
  }
  
  void display() {
    oldAngle = angle;
    angle = processAngle(mouseX, mouseY);
    int rpm = (int) abs((oldAngle - angle) * 500);
    text(rpm + "", 50, 190);
  }
  
  float processAngle(float curX, float curY) {
    PVector dir = new PVector(curX - (width / 2), curY - (height / 2));
    PVector axis = new PVector(10, 0);
    angle = PVector.angleBetween(axis,dir);
    return angle;
  }
}
