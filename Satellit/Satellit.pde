Earth earth;
ApiStuff apiStuff;

int satID = 25544; //ISS norad satelite id
boolean hojre = false, venstre = false, hF = false, vF = false, test = false;
String APIkey = "QW2N5L-YCZ77A-4VZWML-4SPT";
float speed = 1;
PImage backdrop;
PShape station;

void setup() {
  size(1920, 1080, P3D);
  frameRate(60);
  apiStuff = new ApiStuff(APIkey);
  earth = new Earth(hojre, venstre);
  backdrop = loadImage("spaceBackdrop.jpg");
  station = loadShape("satellite_obj.obj");
  station.setFill(color(227,36,36));
}

void draw() {
  update();
  background(backdrop);
  //if(!test)apiStuff.Update(true, satID, 5);
  //test = true; //<>//
  text("Current Speed: "+speed+"x times real world", 1400, 50, 0); //<>//
  text("Use ← and → to change speed", 1400, 80, 0);
  text("Trajectory is updated every 10 seconds", 1400, 110, 0); //<>//
  earth.draw(speed, station);

  fill(255, 255, 255);
  textSize(25);
}

void update() {
  if (hojre == true && speed < 4096 && !hF) {
    speed = speed*2;
    hF = true;
  }

  if (venstre == true && speed > 1 && !vF) {
    speed = speed/2;
    vF = true;
  }

  if (!venstre) vF = false;
  if (!hojre) hF = false;
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
