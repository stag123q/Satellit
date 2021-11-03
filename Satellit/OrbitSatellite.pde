float lat1, lon1, lat2, lon2, alt1, alt2, theta, phi, x, y, z, h, angleb, linearVel;
PVector pos, pos1, pos1copy, pos2, xaxis = new PVector(1, 0, 0), raxis, vel, nyVar;

class OrbitSatellite {

  OrbitSatellite() {
  }

  void update(float[][] snapshot, float earthR, boolean updatePos, float speed) {

    if (updatePos) {
      lat1 = snapshot[0][0];
      lon1 = snapshot[0][1];
      alt1 = snapshot[0][2];

      lat2 = snapshot[1][0];
      lon2 = snapshot[1][1];
      alt2 = snapshot[1][2];

      pos1 = calculate(lat1, lon1); 
      pos2 = calculate(lat2, lon2);
      
      h = alt1 * (earthR/6371) + earthR; //beregner afstanden fra jorden centrum til sateliiten og skalerer den

      pos1copy = pos1;
      vel = pos1copy.sub(pos2); //tiden vil altid være 1, så der behøves ikke mere på hastighedsberegningen
      
      linearVel = vel.mag();
      vel.setMag(linearVel * speed); //speed er den hastighed tiden går i, der også bestemmer jordens rotation
      nyVar = new PVector(vel.x,vel.y,vel.z);
    }
    //println(nyVar);
    //println(updatePos);
    pos1.add(nyVar); 

    angleb = PVector.angleBetween(xaxis, pos1);
    raxis = xaxis.cross(pos1);
  }

  void draw() {
    pushMatrix();
    translate(x, y, z);
    rotate(angleb, raxis.x, raxis.y, raxis.z);
    fill(255);
    box(5, 5, 5);
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
