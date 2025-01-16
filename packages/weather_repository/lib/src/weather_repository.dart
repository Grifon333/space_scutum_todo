import 'package:open_weather_api/open_weather_api.dart' hide Weather;
import 'package:weather_repository/weather_repository.dart';

class WeatherRepository {
  final OpenWeatherApiClient _weatherApiClient;

  WeatherRepository({
    OpenWeatherApiClient? weatherApiClient,
  }) : _weatherApiClient = weatherApiClient ?? OpenWeatherApiClient();

  Future<Weather> getWeather(String city) async {
    final response = await _weatherApiClient.getWeather(city);
    return Weather(
      location: response.name,
      temperatureCurrent: response.main.temperature,
      temperatureMin: response.main.temperatureMin,
      temperatureMax: response.main.temperatureMax,
      condition: response.weather.first.main,
      windSpeed: response.wind.speed,
      windDirection: response.wind.direction,
      icon: response.weather.first.icon,
    );
  }

  Future<String> getImageBytes(String imageCode) =>
      _weatherApiClient.getIconBytes(imageCode);
}
