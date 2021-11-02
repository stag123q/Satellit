PShape globe;
Table table;
float angle = 0.00006963734567901235, r = 400, rotation;
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

  void draw(float rotationSpeed) {

    translate(width*0.5, height*0.5);
    
    rotateY(angle*rotationSpeed*rotation);
    rotation++;
    
    lights();
    fill(200);
    noStroke();
    shape(globe);



  }
}
