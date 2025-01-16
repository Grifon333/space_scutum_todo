import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

@JsonSerializable()
class Weather extends Equatable {
  final String location;
  final double temperatureCurrent;
  final double temperatureMin;
  final double temperatureMax;
  final String condition;
  final double windSpeed;
  final int windDirection;
  final String icon;

  const Weather({
    required this.location,
    required this.temperatureCurrent,
    required this.temperatureMin,
    required this.temperatureMax,
    required this.condition,
    required this.windSpeed,
    required this.windDirection,
    required this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);

  @override
  List<Object> get props => [
        location,
        temperatureCurrent,
        temperatureMin,
        temperatureMax,
        condition,
        windSpeed,
        windDirection,
      ];
}
