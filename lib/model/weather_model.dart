class WeatherModel {
  final String location;
  final String description;
  final double currentTemp;
  final double highTemp;
  final double lowTemp;
  final String sunrise;
  final String sunset;
  final List<String> hourlyForecast;

  WeatherModel({
    required this.location,
    required this.description,
    required this.currentTemp,
    required this.highTemp,
    required this.lowTemp,
    required this.sunrise,
    required this.sunset,
    required this.hourlyForecast,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      location: json['name'],
      description: json['weather'][0]['description'],
      currentTemp: json['main']['temp']?.toDouble() ?? 0.0,
      highTemp: json['main']['temp_max']?.toDouble() ?? 0.0,
      lowTemp: json['main']['temp_min']?.toDouble() ?? 0.0,
      sunrise: DateTime.fromMillisecondsSinceEpoch(json['sys']['sunrise'] * 1000)
          .toLocal()
          .toString()
          .substring(11, 16),
      sunset: DateTime.fromMillisecondsSinceEpoch(json['sys']['sunset'] * 1000)
          .toLocal()
          .toString()
          .substring(11, 16),
      hourlyForecast: List<String>.from(json['hourly'].map((hour) => hour['temp'].toString())), // Change this to match if you use the appropriate API
    );
  }
}