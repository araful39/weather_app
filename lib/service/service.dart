

import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:weater_app/api/api.dart';

class Service {
  getData() async {
    try{
      var response = await http.get(Uri.parse(Api.baseUrl));

    }
        catch (e){
      log("Erorre $e");
        }
  }
}
