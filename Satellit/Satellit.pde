Earth earth;

boolean hojre = false, venstre = false;
float speed = 1;

void setup() {
  size(1920, 1080, P3D);
  frameRate(60);

  earth = new Earth(hojre, venstre);
}

void draw() {
  update();
  background(51);
  text("Current Speed: "+speed+"x times real world", 1400, 50, 0);
  text("Use ← and → to change speed", 1400, 80, 0);
  text("Press spacebar to update trajectory", 1400, 110, 0);
  earth.draw(speed);

  fill(255, 255, 255);
  textSize(25);
}

void update() {
  if (hojre == true && speed < 4096) {
    speed = speed*2;
  }
  
  if (venstre == true && speed > 1) {
    speed = speed/2;
  }
}

//sørger for at controls virker
void HandleInput(int k, boolean b) {

  if (k == 39) hojre = b;
  if (k == 37) venstre = b;
}

void keyPressed() {
  HandleInput(keyCode, true);
}

void keyReleased() {
  HandleInput(keyCode, false);
} 
