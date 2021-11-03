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
      request = "https://api.n2yo.com/rest/v1/satellite/positions/"+id+"/"+observer_lat+"/"+observer_lng+"/"+observer_alt+"/"+positions+"/&apiKey="+apiKey; //<>//
      j = loadJSONObject(request);
      //saveJSONObject(j, "json.json");
      result = new float[2][4]; //[2]: the two datapoints. [3]: The longitude, latitude, altitude, and timestamp, in that order

      JSONArray positionsJson = j.getJSONArray("positions");
      JSONObject pos1 = positionsJson.getJSONObject(0);
      JSONObject pos2 = positionsJson.getJSONObject(1);

      result[0][0] = pos1.getFloat("satlatitude");
      result[0][1] = pos1.getFloat("satlongitude");
      result[0][2] = pos1.getFloat("sataltitude");
      result[0][3] = pos1.getFloat("timestamp");
      result[1][0] = pos2.getFloat("satlatitude");
      result[1][1] = pos2.getFloat("satlongitude");
      result[1][2] = pos2.getFloat("sataltitude");
      result[1][3] = pos2.getFloat("timestamp");

      //Kode der engang var smuk før jeg indså at processings JSON behandler var dum
      /*for (int i=0; i<2; i++) {
       result[i][0] = j.getJSONArray("*."+i+".satlatitude").getFloat(0);
       result[i][1] = j.getJSONArray("*."+i+".satlongitude").getFloat(0);
       result[i][2] = j.getJSONArray("*."+i+".sataltitude").getFloat(0);
       result[i][3] = j.getJSONArray("*."+i+".timestamp").getFloat(0);
       }*/
    }
    return result;
  }
}
