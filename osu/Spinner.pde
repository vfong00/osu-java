public class Spinner extends Thing {
  float startTime, endTime, angle, oldAngle, angleTurned, timeDispScore, percent;
  int fakeRPM, oldTimesTurned, timesTurned, quota, score;
  boolean complete, dead, checked;
  PImage spinnerPhoto;
  
  Spinner(float startTime, float endTime, int quota) {
    super(500, 400);
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
    timeDispScore = 255;
    dead = false;
    checked = false;
    this.quota = quota;
  }
  
  void display() {
    if (!dead) {
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
        percent = angleTurned / (quota * 2 * PI);
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
    } else {
      updateScore();
      if (timeDispScore > 0) {
        displayFinalScore(width / 2 + 5, height / 2 + 5);
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
  
  void setDead() {
    dead = true;
  }
  
  boolean isDead() {
    return dead;
  }
  
  boolean isComplete() {
    return complete;
  }
  
  boolean checked() {
    return checked;
  }
  
  void setChecked() {
    checked = true;
  }
  
  // creates a pop-up number next to the ending of a circle (or a slider end)
  void displayFinalScore(float xcor, float ycor) {
    String dispText = "";
    if (getScore() == 300) {
      fill(0, 255, 255, timeDispScore);
      dispText= "300";
    } else if (getScore() == 100) {
      fill(127, 255, 0, timeDispScore);
      dispText = "100";
    } else if (getScore() == 50) {
      fill(160, 32, 240, timeDispScore);
      dispText = "50";
    } else { 
      fill(255, 0, 0, timeDispScore);
      dispText = "X";
    }
    textSize(25);
    text(dispText, xcor + 10, ycor + 10);
    timeDispScore -= 2;
    textSize(32);
  }
  
  void updateScore() {
    if (dead) {
      if (percent == 1) score = 300;
      else if (percent > (2 / 3.0)) score = 100;
      else if (percent > (1 / 3.0)) score = 50;
      else score = 0;
    } else if (oldTimesTurned != timesTurned) {
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
