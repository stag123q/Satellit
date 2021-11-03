class ApiStuff {
  String apiKey, request = "";
  JSONObject j;
  int positions = 2; //Number of positions, 1 second apart, to get
  int observer_lat = 0, observer_lng = 0, observer_alt = 0; //Our position

  public ApiStuff(String a) {
    apiKey = a;
  }

  float[][] Update(boolean fetch, int id, int positions) {
    float[][] result = {{-1}};

    if (fetch) {
      request = "https://api.n2yo.com/rest/v1/satellite/positions/"+id+"/"+observer_lat+"/"+observer_lng+"/"+observer_alt+"/"+positions+"/&apiKey="+apiKey;
      j = loadJSONObject(request);
      //saveJSONObject(j, "json.json");

      result = new float[positions][4]; //[2]: the two datapoints. [3]: The longitude, latitude, altitude, and timestamp, in that order
      JSONArray positionsJson = j.getJSONArray("positions");

      for (int i = 0; i < positions; i++) {
        JSONObject pos1 = positionsJson.getJSONObject(i);
        result[i][0] = pos1.getFloat("satlatitude");
        result[i][1] = pos1.getFloat("satlongitude");
        result[i][2] = pos1.getFloat("sataltitude");
        result[i][3] = pos1.getFloat("timestamp");
      }
    }
    return result; //<>//
  }
}
