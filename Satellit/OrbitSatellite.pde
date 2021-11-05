float lat1, lon1, lat2, lon2, alt1, alt2, theta, phi, x, y, z, h, angleb, linearVel, earthR;
PVector pos, pos1, pos1copy, pos2, xaxis = new PVector(1, 0, 0), raxis, vel, nyVar, heightVec1, heightVec2;

class OrbitSatellite {

  OrbitSatellite() {
  }

  void update(float[][] snapshot, float R, boolean updatePos, float speed) {
    
    earthR = R + 20;

    if (updatePos) {
      lat1 = snapshot[0][0];
      lon1 = snapshot[0][1];
      alt1 = snapshot[0][2];

      lat2 = snapshot[1][0];
      lon2 = snapshot[1][1];
      alt2 = snapshot[1][2];

      pos1 = calculate(lat1, lon1, alt1); 
      pos2 = calculate(lat2, lon2, alt2);

      h = alt1 * (earthR/6371); //beregner afstanden fra jorden centrum til sateliiten og skalerer den

      heightVec1 = pos1.normalize();
      heightVec1.setMag(h);

      heightVec2 = pos2.normalize();
      heightVec2.setMag(h);

      pos1 = pos1.add(heightVec1);
      pos2 = pos2.add(heightVec2);

      pos1copy = new PVector(pos1.x, pos1.y, pos1.z);
      vel = pos1copy.sub(pos2); //tiden vil altid være 1, så der behøves ikke mere på hastighedsberegningen

      linearVel = vel.mag();
      vel.setMag(linearVel*-0.02); 
      nyVar = new PVector(vel.x, vel.y, vel.z);
    }

    //println(nyVar);
    //println(updatePos);
    //pos1.add(nyVar); 
    //println(pos1);
    x += nyVar.x;
    y += nyVar.y;
    z += nyVar.z;

    angleb = PVector.angleBetween(xaxis, pos1);
    raxis = xaxis.cross(pos1);
  }

  void draw(PShape satellite) {
    pushMatrix();
    translate(x, y, z);
    rotate(angleb, raxis.x, raxis.y, raxis.z);

    fill(255,150,150);
    //box(5, 5, 5);

    shape(satellite);

    popMatrix();
  }

  PVector calculate(float lat, float lon, float alt) {
    theta = radians(lat);
    phi = radians(lon) + PI;

    x = (r + h) * cos(theta) * cos(phi);
    y = (-r + h) * sin(theta);
    z = (-r + h) * cos(theta) * sin(phi);
    pos = new PVector(x, y, z);

    return pos;
  }
}
