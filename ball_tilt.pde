ArrayList<Coin> coins;

void setup() {
  size(900, 1800);
  translate(displayWidth/2, displayHeight/2);
  noStroke();
  fill(0);
  textFont(createFont("SansSerif", 30 * displayDensity));
  setup_vibration();
  setup_box_world();
  setup_ball();
  
  coins = new ArrayList<Coin>();
  for(int i = 0; i < 20; ++i){ 
    coins.add(new Coin());
  }
}

void touchStarted() {
  for(Coin coin : coins){ 
    coin.reposition();
  }
}

void draw() {
  update_box_world();
  ball.update();
  background(204);
  ball.show();
  
  for(Coin coin : coins){
    coin.show();
  }
}
