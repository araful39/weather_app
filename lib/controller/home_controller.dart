import 'dart:developer';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weater_app/model/weather_model.dart';
import 'package:weater_app/service/api_service.dart';
import 'package:weater_app/service/location_service.dart';

class HomeController extends GetxController {
  var isLoading = false.obs;
  Rx<WeatherModel> weatherModel = WeatherModel().obs;
  getData() async {
    log("------------1111111111111--------------");
isLoading = true.obs;
    Position? position = await LocationService().getCurrentLocation();

    WeatherModel? data =
        await ApiService.fetchData(position!.latitude, position.longitude);
    weatherModel.value = data!;
    isLoading = false.obs;
    log("------------22222222222222222222--------------");
  }

  @override
  void onInit() {
    super.onInit();
    log("------------000000000000000000000000--------------");

    getData();
  }
}
