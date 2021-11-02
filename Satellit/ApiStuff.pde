class ApiStuff {
  String apiKey, request = "";
  JSONObject j;
  int positions = 2; //Number of positions, 1 second apart, to get
  int observer_lat = 0, observer_lng = 0, observer_alt = 0; //Our position

  public ApiStuff(String a) {
    apiKey = a;
  }

  float[][] Update(boolean fetch, int id) {
    float[][] result = {{-1}};

    if (fetch) {
      request = "https://api.n2yo.com/rest/v1/satellite/positions/"+id+"/"+observer_lat+"/"+observer_lng+"/"+observer_alt+"/"+positions+"/&apiKey="+apiKey;
      j = loadJSONObject(request);

      result = new float[2][4]; //[2]: the two datapoints. [3]: The longitude, latitude, altitude, and timestamp, in that order

      for (int i=0; i<2; i++) {
        result[i][0] = j.getFloat("$.positions."+i+".satlatitude");
        result[i][1] = j.getFloat("$.positions."+i+".satlongitude");
        result[i][2] = j.getFloat("$.positions."+i+".sataltitude");
        result[i][3] = j.getFloat("$.positions."+i+".timestamp");
      }
    }
    return result;
  }
}
