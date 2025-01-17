import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:open_weather_api/open_weather_api.dart';
import 'config.dart';

/// Dart API Client which wraps the [OpenWeather API](https://openweathermap.org/api)
///
/// [client]: An optional [http.Client] instance. If not provided, a default client is used.
class OpenWeatherApiClient {
  final http.Client _client;
  static const String _baseUrlWeather = 'api.openweathermap.org';
  static const String _baseUrlIcon = 'openweathermap.org';

  OpenWeatherApiClient({
    http.Client? client,
  }) : _client = client ?? http.Client();

  /// Fetches [Response] for a given [city] `/data/2.5/weather?q={city}`
  ///
  /// - [city]: The name of the city for which to fetch the weather.
  ///
  /// Returns:
  /// - A [Response] object containing the weather data.
  ///
  /// Throws:
  /// - [WeatherRequestApiKeyFailure] if the API key is invalid.
  /// - [WeatherRequestCityNameFailure] if the city name is invalid or not found.
  /// - [WeatherRequestCountCallsFailure] if the API rate limit is exceeded.
  /// - [WeatherRequestServerFailure] if there are server-side issues.
  Future<Response> getWeather(String city) async {
    final url = Uri.https(
      _baseUrlWeather,
      '/data/2.5/weather',
      {
        'q': city,
        'units': 'metric',
        'appid': Config.apiKey,
      },
    );
    final response = await _client.get(url);
    _validateResponse(response);
    final Map<String, dynamic> json = await jsonDecode(response.body);
    return Response.fromJson(json);
  }

  /// Fetches the weather icon as a Base64-encoded string.
  ///
  /// - [icon]: The icon code representing the weather condition.
  ///
  /// Returns:
  /// - A Base64-encoded string of the icon image.
  ///
  /// Throws:
  /// - [WeatherRequestFailure] if the response is not valid.
  Future<String> getIconBytes(String icon) async {
    final url = Uri.https(
      _baseUrlIcon,
      '/img/wn/$icon@4x.png',
    );
    final response = await _client.get(url);
    _validateResponse(response);
    return base64Encode(response.bodyBytes);
  }

  /// Validates the HTTP response status code and throws appropriate exceptions.
  ///
  /// Throws:
  /// - [WeatherRequestApiKeyFailure] for a 401 status code.
  /// - [WeatherRequestCityNameFailure] for a 404 status code.
  /// - [WeatherRequestCountCallsFailure] for a 429 status code.
  /// - [WeatherRequestServerFailure] for server-side errors (5xx).
  void _validateResponse(http.Response response) =>
      switch (response.statusCode) {
        401 => throw WeatherRequestApiKeyFailure(),
        404 => throw WeatherRequestCityNameFailure(),
        429 => throw WeatherRequestCountCallsFailure(),
        500 || 502 || 503 || 504 => throw WeatherRequestServerFailure(),
        _ => null,
      };
}

/// Base exception class for weather request failures.
abstract class WeatherRequestFailure implements Exception {}

/// Thrown when the API key is invalid or missing.
class WeatherRequestApiKeyFailure implements WeatherRequestFailure {}

/// Thrown when the requested city name is not found.
class WeatherRequestCityNameFailure implements WeatherRequestFailure {}

/// Thrown when the API request limit is exceeded.
class WeatherRequestCountCallsFailure implements WeatherRequestFailure {}

/// Thrown when there is a server-side issue with the weather API.
class WeatherRequestServerFailure implements WeatherRequestFailure {}
