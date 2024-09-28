import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weater_app/model/weather_model.dart';
import 'package:weater_app/service/api_service.dart';
import 'package:weater_app/service/location_service.dart';

class HomeController extends GetxController {
  var isLoading = true.obs;
  var weatherData = WeatherModel(
    location: '',
    description: '',
    currentTemp: 0,
    highTemp: 0,
    lowTemp: 0,
    sunrise: '',
    sunset: '',
    hourlyForecast: [],
  ).obs;
  getData() async {
    Position position = await LocationService().getCurrentLocation();
    WeatherModel data =
        await ApiService.fetchData(position.latitude, position.longitude);
    weatherData.value = data;
  }

  @override
  void onInit() {
    super.onInit();
    getData();
  }
}
