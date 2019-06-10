class HealthBar {
  float degenRate, health, maxHealth;
  public HealthBar(float health, float degenRate) {
    this.health = health;
    maxHealth = health;
    this.degenRate = degenRate;
  }
  
  void display() {
    
  }
  
  float getHealth() {
    return health;
  }
  
  void addHealth(float add) {
    health += add;
    if (health > maxHealth) health = maxHealth;
  }
}
