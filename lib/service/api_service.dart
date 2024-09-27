import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:weater_app/api/api.dart';
import 'package:weater_app/model/weather_model.dart';

class ApiService {
  static fetchData() async {
    try {
      var response = await http.get(Uri.parse(Api.baseUrl));
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        return WeatherModel.fromJson(json);
      } else {
        log("Error: ${response.statusCode}");
      }
    } catch (e) {
      log("Error $e");
      return null;
    }
  }
}
