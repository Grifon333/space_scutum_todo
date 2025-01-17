import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

@JsonSerializable()
class Weather {
  /// Weather condition ID
  int id;
  /// Group of weather parameters (Rain, Snow, Clouds etc.)
  String main;
  /// Weather condition within the group.
  String description;
  /// Weather icon id
  String icon;

  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) => _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}
