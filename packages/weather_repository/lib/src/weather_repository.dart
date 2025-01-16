import 'package:open_weather_api/open_weather_api.dart' hide Weather;
import 'package:weather_repository/weather_repository.dart';

class WeatherRepository {
  final OpenWeatherApiClient _weatherApiClient;

  WeatherRepository({
    required OpenWeatherApiClient? weatherApiClient,
  }) : _weatherApiClient = weatherApiClient ?? OpenWeatherApiClient();

  Future<Weather> getWeather(String city) async {
    final response = await _weatherApiClient.getWeather(city);
    return Weather(
      location: response.system.country,
      temperature: response.main.temperature,
      temperatureMin: response.main.temperatureMin,
      temperatureMax: response.main.temperatureMax,
      weatherType: response.weather.first.main,
      windSpeed: response.wind.speed,
      windDirection: response.wind.direction,
    );
  }
}
