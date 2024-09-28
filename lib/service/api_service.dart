import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:weater_app/model/weather_model.dart';

class ApiService {
  static Future<WeatherModel?> fetchData(double lat, double lon) async {
    log("------------444444444444444444444444444--------------");
    log("------------lat:$lat----$lon--------------");
    try {
      log("------------5555555555555555555555--------------");
      var response = await http.get(Uri.parse(

          "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=509079b22fae7e954dff8403ef5eba0e"));
      if (response.statusCode == 200) {
        log("respons: ${response.statusCode}");
        var json = jsonDecode(response.body);
        log("------------Json:$json--------------");
        return WeatherModel.fromJson(json);
      } else {
        log("------------6666666666666665--------------");

        log("Error: ${response.statusCode}");
      }
    } catch (e) {
      log("------------77777777777777777777--------------");

      log("Error $e");

    }
    return null;
  }
}
