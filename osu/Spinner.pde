public class Spinner extends Thing {
  float startTime, theta;
  PImage spinnerPhoto;
  
  Spinner(float startTime) {
    super(width / 2, height / 2);
    this.startTime = startTime;
    
    theta = 0;
  }
  
  void display() {
    if (mouseX == width / 2 && mouseY == height / 2) theta = 0;
    else theta = atan((mouseY - (height / 2)) / (mouseX - (width / 2))) * 360;
    // pushMatrix();
    text(theta + "", 50, 160);
  }
}
