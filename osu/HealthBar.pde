class HealthBar {
  float degenRate, health, maxHealth;
  boolean dead;
  public HealthBar(float health, float degenRate) {
    this.health = health;
    maxHealth = health;
    this.degenRate = degenRate;
    dead = false;
  }
  
  void display() {
    stroke(255);
    strokeWeight(2);
    line(40, 20, 540, 20);
    line(40, 30, 540, 30);
    line(40, 20, 40, 30);
    line(540, 20, 540, 30);
    fillHealth();
  }
  
  void fillHealth() {
    health -= degenRate;
    if (health < 0) {
      dead = true;
      health = 0;
    }
    fill(255);
    rect(40, 20, health, 10);
  }
  
  float getHealth() {
    return health;
  }
  
  void changeHealth(float add) {
    health += add;
    if (health > maxHealth) health = maxHealth;
    if (health < 0) {
      dead = true;
      health = 0;
    }
  }
  
  void changeDegenRate(float newRate) {
    degenRate = newRate;
  }
}
