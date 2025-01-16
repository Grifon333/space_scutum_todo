import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_repository/weather_repository.dart'
    as weather_repository;

import 'models.dart';

part 'weather.g.dart';

@JsonSerializable()
class Weather extends Equatable {
  final String location;
  final Temperature temperature;
  final String condition;
  final Wind wind;
  final String icon;
  final DateTime lastUpdate;

  const Weather({
    required this.location,
    required this.temperature,
    required this.condition,
    required this.wind,
    required this.icon,
    required this.lastUpdate,
  });

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);

  factory Weather.fromRepository(weather_repository.Weather weather) {
    return Weather(
      location: weather.location,
      temperature: Temperature(
        current: weather.temperatureCurrent,
        min: weather.temperatureMin,
        max: weather.temperatureMax,
      ),
      condition: weather.condition,
      wind: Wind(speed: weather.windSpeed, direction: weather.windDirection),
      icon: weather.icon,
      lastUpdate: DateTime.now(),
    );
  }

  static final empty = Weather(
    location: '--',
    temperature: Temperature.empty,
    condition: 'unknown',
    wind: Wind.empty,
    icon: '',
    lastUpdate: DateTime(0),
  );

  @override
  List<Object> get props => [
        location,
        temperature,
        condition,
        wind,
        icon,
        lastUpdate,
      ];

  Weather copyWith({
    String? location,
    Temperature? temperature,
    String? condition,
    Wind? wind,
    String? icon,
    DateTime? lastUpdate,
  }) {
    return Weather(
      location: location ?? this.location,
      temperature: temperature ?? this.temperature,
      condition: condition ?? this.condition,
      wind: wind ?? this.wind,
      icon: icon ?? this.icon,
      lastUpdate: lastUpdate ?? this.lastUpdate,
    );
  }
}
