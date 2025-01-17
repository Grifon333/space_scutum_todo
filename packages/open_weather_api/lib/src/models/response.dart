import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'response.g.dart';

/// Represents the weather data returned by the OpenWeather API.
@JsonSerializable()
class Response {
  /// Geographical coordinates of the location.
  @JsonKey(name: 'coord')
  Coordinates coordinates;

  /// Weather conditions (id, name, description, icon)
  List<Weather> weather;

  /// Internal parameter for the weather data source.
  String base;

  /// Main weather data (temperature, pressure, humidity, seaLevel, groundLevel)
  Main main;

  /// Visibility in meters. The maximum value of the visibility is 10 km
  int visibility;

  /// Wind data (speed, direction)
  Wind wind;

  /// Clouds data
  Clouds clouds;

  /// Time of data calculation in Unix timestamp.
  @JsonKey(name: 'dt')
  int dateTime;

  /// Internal parameter for the weather data source.
  @JsonKey(name: 'sys')
  System system;

  /// Shift in seconds from UTC
  int timezone;

  /// City ID
  int id;

  /// City name
  String name;

  /// Internal parameter
  @JsonKey(name: 'cod')
  int code;

  Response({
    required this.coordinates,
    required this.weather,
    required this.base,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.clouds,
    required this.dateTime,
    required this.system,
    required this.timezone,
    required this.id,
    required this.name,
    required this.code,
  });

  factory Response.fromJson(Map<String, dynamic> json) =>
      _$ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseToJson(this);
}
