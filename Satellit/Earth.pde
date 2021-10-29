PShape globe;
Table table;
float angle, r = 400;
PImage world;
boolean rotateRight, rotateLeft;

class Earth {

  Earth(boolean right, boolean left) {
    world= loadImage("earth.jpg");
    globe = createShape(SPHERE, r);
    globe.setTexture(world);
    rotateRight = right;
    rotateLeft = left;
  }

  void draw() {

    translate(width*0.5, height*0.5);
    
    //if (rotateRight && !rotateLeft) {
    //rotateY(angle);
    //angle += 0.5;
    //}

    //if (!rotateRight && rotateLeft) {
    //  rotateY(angle);
    //  angle -= 0.05;
    //}
    
    lights();
    fill(200);
    noStroke();
    shape(globe);



  }
}
