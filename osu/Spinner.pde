public class Spinner extends Thing {
  float startTime, theta;
  PImage spinnerPhoto;
  
  Spinner(float startTime) {
    super(width / 2, height / 2);
    this.startTime = startTime;
    this.spinnerPhoto = loadImage("Images/spinner-circle@2x.png");
    theta = 0;
  }
  
  void display() {
    PVector dir = new PVector(mouseX - (width / 2), mouseY - (height / 2));
    PVector axis = new PVector(10, 0);
    float angle = PVector.angleBetween(axis,dir);
    text(angle + "", 50, 160);
  }
}
