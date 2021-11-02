float lat1 = 30, lon1 = 30, lat2 = 30.0001, lon2 = 30.0001, theta, phi, x, y, z, h = 425, angleb;
PVector pos, pos1, pos2, xaxis = new PVector(1, 0, 0), raxis, vel;

class OrbitSatellite {

  OrbitSatellite() {
  }

  void update() {
    /*
     lat1 = snapshot[0][0]
     lon1 = snapshot[0][1]
     alt1 = snapshot[0][2]
     
     lat1 = snapshot[1][0]
     lon1 = snapshot[1][1]
     alt1 = snapshot[1][2]
     */

    pos1 = calculate(lat1, lon1); 
    pos2 = calculate(lat2, lon2);

    vel = pos1.sub(pos2); //tiden vil altid være 1, så der behøves ikke mere på hastighedsberegningen
    pos1.add(vel); 

    angleb = PVector.angleBetween(xaxis, pos1);
    raxis = xaxis.cross(pos1);
  }

  void draw() {
    pushMatrix();
    translate(x, y, z);
    rotate(angleb, raxis.x, raxis.y, raxis.z);
    fill(255);
    box(h, 5, 5);
    popMatrix();
  }

  PVector calculate(float lat, float lon) {
    theta = radians(lat);
    phi = radians(lon) + PI;

    x = r * cos(theta) * cos(phi);
    y = -r * sin(theta);
    z = -r * cos(theta) * sin(phi);
    pos = new PVector(x, y, z);

    return pos;
  }
}
