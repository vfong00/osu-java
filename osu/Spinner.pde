public class Spinner extends Thing {
  float startTime, endTime, angle, oldAngle;
  PImage spinnerPhoto;
  
  Spinner(float startTime, float endTime) {
    super(width / 2, height / 2);
    this.startTime = startTime;
    this.endTime = endTime;
    this.spinnerPhoto = loadImage("Images/spinner-circle@2x.png");
    spinnerPhoto.resize(250, 250);
    
    angle = processAngle(mouseX, mouseY);
    oldAngle = 0;
  }
  
  void display() {
    oldAngle = angle;
    angle = processAngle(mouseX, mouseY);
    int rpm = (int) abs((oldAngle - angle) * 500);
    text(rpm + "", 50, 190);
    
    pushMatrix();
    translate(width / 2, height / 2);
    tint(255, 255);
    rotate(oldAngle);
    image(spinnerPhoto, 0, 0);
    popMatrix();
    fill(255);
  }
  
  float processAngle(float curX, float curY) {
    PVector dir = new PVector(curX - (width / 2), curY - (height / 2));
    PVector axis = new PVector(10, 0);
    angle = PVector.angleBetween(axis,dir);
    return angle;
  }
  
  float getStartTime() {
    return startTime;
  }
  
  float getEndTime() {
    return endTime;
  }
}
