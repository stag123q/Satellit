Earth earth;

void setup() {
  size(1920, 1080, P3D);

  earth = new Earth();
}

void draw() {
  background(51);
  earth.draw();
}
