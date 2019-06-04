public class Spinner extends Thing {
  float startTime, endTime, angle, oldAngle, angleTurned;
  int fakeRPM, timesCircled, quota;
  PImage spinnerPhoto, meterPhoto;
  
  Spinner(float startTime, float endTime, int quota) {
    super(width / 2, height / 2);
    this.startTime = startTime;
    this.endTime = endTime;
    this.spinnerPhoto = loadImage("Images/spinner-circle@2x.png");
    spinnerPhoto.resize(360, 360);
    this.meterPhoto = loadImage("Images/spinner-metre@2x.png");
    meterPhoto.resize((int) (1.536 * height), height);
    
    angle = processAngle(mouseX, mouseY);
    oldAngle = 0;
    fakeRPM = 0;
    angleTurned = 0;
    timesCircled = 0;
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
    text("RPM: " + fakeRPM, width / 2, 790);
    
    // angle that the spinner is at
    float newAngle = (fakeRPM / 500.0) * (2 * PI);
    
    // determining cycles
    timesCircled = (int) (angleTurned / (2 * PI));
    
    // displays the spinner
    pushMatrix();
    translate(width / 2, height / 2 + 20);
    tint(255, 255);
    if (mousePressed) rotate((oldAngle + angle) / 2);
    else rotate(newAngle);
    image(spinnerPhoto, 0, 0);
    popMatrix();
    
    // displays the spinner meter
  }
  
  void displayMeter() {
    pushMatrix();
    translate(width / 2, height / 2);
    tint(255, 50);
    image(meterPhoto, 0, 0);
    popMatrix();
    for (int x = 0; x < width; x++) {
      for (int y = 0; y < height; y++) {
        int pixelInd = x + (y * width);
        color pixColor = meterPhoto.pixels[pixelInd];
        
      }
    }
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
