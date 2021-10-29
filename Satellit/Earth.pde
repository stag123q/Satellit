PShape globe;
Table table;
float angle, r = 400;
PImage world;

class Earth {

  Earth() {
    world= loadImage("earth.jpg");
    globe = createShape(SPHERE, r);
    globe.setTexture(world);
  }

  void draw() {

    translate(width*0.5, height*0.5);
    lights();
    fill(200);
    noStroke();
    shape(globe);
  }
}
