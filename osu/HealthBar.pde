class HealthBar {
  float degenRate, health, maxHealth;
  public HealthBar(float health, float degenRate) {
    this.health = health;
    maxHealth = health;
    this.degenRate = degenRate;
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
    
  }
  
  float getHealth() {
    return health;
  }
  
  void addHealth(float add) {
    health += add;
    if (health > maxHealth) health = maxHealth;
  }
}
