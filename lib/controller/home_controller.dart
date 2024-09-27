import 'dart:developer';

import 'package:get/get.dart';
import 'package:weater_app/model/weather_model.dart';
import 'package:weater_app/service/api_service.dart';

class HomeController extends GetxController {
  Rx<WeatherModel> weatherData = WeatherModel().obs;
  @override
  void onInit() {
    super.onInit();
    getData();
  }

  getData() async {
    weatherData.value =
        await ApiService.fetchData() ?? WeatherModel(); // Update observable
  }
}
