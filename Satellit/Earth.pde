PShape globe;
Table table;
float angle = 0.00006963734567901235, r = 400, rotation, oldRot;
PImage world;
boolean rotateRight, rotateLeft;
OrbitSatellite orbitSatellite;

class Earth {

  Earth(boolean right, boolean left) {
    world= loadImage("earth.jpg");
    sphereDetail(100);
    noStroke();
    globe = createShape(SPHERE, r);
    globe.setTexture(world);
    rotateRight = right;
    rotateLeft = left;

    orbitSatellite = new OrbitSatellite();
  }

  void draw(float rotationSpeed, float[][] result, boolean uP, PShape satellite) {
    pushMatrix();
    translate(width*0.5, height*0.5);
    oldRot = rotation;
    rotation = ((angle*rotationSpeed)+oldRot);
    rotateY(rotation);

    noLights();
    fill(200);
    shape(globe);

    orbitSatellite.update(result, r, uP, rotationSpeed);
    orbitSatellite.draw(satellite);
    popMatrix();
    
  }
}
