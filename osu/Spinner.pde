public class Spinner extends Thing {
  float startTime, endTime, angle, oldAngle, angleTurned;
  int fakeRPM, oldTimesTurned, timesTurned, quota, score;
  boolean complete;
  PImage spinnerPhoto;
  
  Spinner(float startTime, float endTime, int quota) {
    super(width / 2, height / 2);
    this.startTime = startTime;
    this.endTime = endTime;
    this.spinnerPhoto = loadImage("Images/spinner-circle@2x.png");
    spinnerPhoto.resize(360, 360);
    
    angle = processAngle(mouseX, mouseY);
    oldAngle = 0;
    fakeRPM = 0;
    angleTurned = 0;
    oldTimesTurned = 0;
    timesTurned = 0;
    score = 0;
    this.quota = quota;
  }
  
  void display() {
    oldAngle = angle;
    if (mousePressed) angle = processAngle(mouseX, mouseY);
    
    // calculating the rpm that changes the spinner speed
    int rpm = (int) abs((oldAngle - angle) * 500);
    angleTurned += abs(oldAngle - angle);
    fakeRPM = ((46 * fakeRPM) / 50) + (rpm / 10);
    textSize(32);
    fill(255);
    text("RPM: " + fakeRPM, width / 2 - 60, 790);
    
    // angle that the spinner is at
    float newAngle = (fakeRPM / 500.0) * (2 * PI);
    
    // determining cycles
    timesTurned = (int) (angleTurned / (2 * PI));
    
    // displays the spinner
    pushMatrix();
    translate(width / 2, height / 2 + 20);
    tint(255, 255);
    if (mousePressed) rotate((oldAngle + angle) / 2);
    else rotate(newAngle);
    image(spinnerPhoto, 0, 0);
    popMatrix();
    
    // displays amount turned before completion
    if (!complete) {
      float percent = angleTurned / (quota * 2 * PI);
      if (percent > 1) {
        complete = true;
        percent = 1;
      }
      textSize(15);
      text((int) (percent * 10000) / 100 + "%", width / 2 - 10, 560);
      textSize(32);
    } else {
      if (timesTurned > quota) text((timesTurned - quota) * 1000, width / 2 - 40, 580);
    }
    updateScore();
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
  
  void updateScore() {
    if (oldTimesTurned != timesTurned) {
      if (complete) score = 1000;
      else score = 100;
      oldTimesTurned = timesTurned;
    } 
    else score = 0;
  }
  
  int getScore() {
    return score;
  }
}
