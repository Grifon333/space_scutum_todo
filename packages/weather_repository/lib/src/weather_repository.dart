import 'package:open_weather_api/open_weather_api.dart' hide Weather;
import 'package:weather_repository/weather_repository.dart';

/// A repository for fetching weather data.
///
/// Provides an abstraction layer over the [OpenWeatherApiClient] to transform
/// raw API data into application-specific models.
class WeatherRepository {
  final OpenWeatherApiClient _weatherApiClient;

  WeatherRepository({
    OpenWeatherApiClient? weatherApiClient,
  }) : _weatherApiClient = weatherApiClient ?? OpenWeatherApiClient();

  /// Fetches the weather data for a given [city] and returns it as a [Weather] object.
  ///
  /// - [city]: The name of the city for which weather data is to be fetched.
  /// Returns: A [Weather] object containing weather details for the city.
  ///
  /// Throws:
  /// - Any exceptions thrown by the [OpenWeatherApiClient.getWeather].
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

  /// Fetches the base64-encoded image bytes for a given weather icon.
  ///
  /// - [imageCode]: The icon code to fetch the weather icon image.
  /// - Returns: A base64-encoded string representing the weather icon.
  Future<String> getImageBytes(String imageCode) =>
      _weatherApiClient.getIconBytes(imageCode);
}
