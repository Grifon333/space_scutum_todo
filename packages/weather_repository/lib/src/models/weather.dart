import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

@JsonSerializable()
class Weather extends Equatable {
  final String location;
  final double temperature;
  final double temperatureMin;
  final double temperatureMax;
  final String weatherType;
  final double windSpeed;
  final int windDirection;

  const Weather({
    required this.location,
    required this.temperature,
    required this.temperatureMin,
    required this.temperatureMax,
    required this.weatherType,
    required this.windSpeed,
    required this.windDirection,
  });

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);

  @override
  List<Object> get props => [
        location,
        temperature,
        temperatureMin,
        temperatureMax,
        weatherType,
        windSpeed,
        windDirection,
      ];
}
