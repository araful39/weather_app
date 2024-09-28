
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weater_app/model/weather_model.dart';
import 'package:weater_app/service/api_service.dart';
import 'package:weater_app/service/location_service.dart';

class HomeController extends GetxController {
  var isLoading = false.obs;
  Rx<WeatherModel> weatherModel = WeatherModel().obs;
  getData() async {
isLoading = true.obs;
    Position? position = await LocationService().getCurrentLocation();

    WeatherModel? data =
        await ApiService.fetchData(position!.latitude, position.longitude);
    weatherModel.value = data!;
    isLoading = false.obs;
  }

  @override
  void onInit() {
    super.onInit();

    getData();
  }
}
