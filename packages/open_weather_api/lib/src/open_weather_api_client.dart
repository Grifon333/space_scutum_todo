import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:open_weather_api/open_weather_api.dart';

class OpenWeatherApiClient {
  final http.Client _client;

  OpenWeatherApiClient({
    http.Client? client,
  }) : _client = client ?? http.Client();

  Future<Response> getWeather(String city) async {
    final url = Uri.https(
      'api.openweathermap.org',
      '/data/2.5/weather',
      {
        'q': city,
        'units': 'metrics',
        'appid': 'b537cebafba5f3e160e7f027d9b321a9',
      },
    );
    try {
      final response = await _client.get(url);
      _validateResponse(response);
      final Map<String, dynamic> json = await jsonDecode(response.body);
      return Response.fromJson(json);
    } catch (e) {
      throw Exception(e);
    }
  }

  void _validateResponse(http.Response response) =>
      switch (response.statusCode) {
        401 => throw WeatherRequestApiKeyFailure(),
        404 => throw WeatherRequestCityNameFailure(),
        429 => throw WeatherRequestCountCallsFailure(),
        _ => null,
      };
}

abstract class WeatherRequestFailure implements Exception {}

class WeatherRequestApiKeyFailure implements WeatherRequestFailure {}

class WeatherRequestCityNameFailure implements WeatherRequestFailure {}

class WeatherRequestCountCallsFailure implements WeatherRequestFailure {}
