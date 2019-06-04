public class Spinner extends Thing {
  float startTime, endTime, angle, oldAngle;
  int fakeRPM;
  PImage spinnerPhoto;
  
  Spinner(float startTime, float endTime) {
    super(width / 2, height / 2);
    this.startTime = startTime;
    this.endTime = endTime;
    this.spinnerPhoto = loadImage("Images/spinner-circle@2x.png");
    spinnerPhoto.resize(250, 250);
    
    angle = processAngle(mouseX, mouseY);
    oldAngle = 0;
    fakeRPM = 0;
  }
  
  void display() {
    oldAngle = angle;
    if (mousePressed) angle = processAngle(mouseX, mouseY);
    
    // calculating the rpm that changes the spinner speed
    int rpm = (int) abs((oldAngle - angle) * 500);
    fakeRPM = ((46 * fakeRPM) / 50) + (rpm / 10);
    text("RPM: " + fakeRPM, width / 2, 790);
    
    // angle that the spinner is at
    float newAngle = (fakeRPM / 500.0) * (2 * PI);
    text(newAngle + "", 50, 160);
    
    // displays the spinner
    pushMatrix();
    translate(width / 2, height / 2);
    tint(255, 255);
    rotate(newAngle);
    image(spinnerPhoto, 0, 0);
    fill(255);
    popMatrix();
    
    
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
