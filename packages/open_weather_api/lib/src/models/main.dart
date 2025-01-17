import 'package:json_annotation/json_annotation.dart';

part 'main.g.dart';

@JsonSerializable()
class Main {
  /// Temperature. Unit Default: Kelvin, Metric: Celsius, Imperial: Fahrenheit
  @JsonKey(name: 'temp')
  double temperature;

  /// Temperature. This temperature parameter accounts for the human perception
  /// of weather. Unit Default: Kelvin, Metric: Celsius, Imperial: Fahrenheit
  @JsonKey(name: 'feels_like')
  double feelsLike;

  /// Atmospheric pressure on the sea level, hPa
  int pressure;

  /// Humidity, %
  int humidity;

  /// Minimum temperature at the moment
  @JsonKey(name: 'temp_min')
  double temperatureMin;

  /// Maximum temperature at the moment
  @JsonKey(name: 'temp_max')
  double temperatureMax;

  /// Atmospheric pressure on the sea level, hPa
  @JsonKey(name: 'sea_level')
  int seaLevel;

  /// Atmospheric pressure on the ground level, hPa
  @JsonKey(name: 'grnd_level')
  int groundLevel;

  Main({
    required this.temperature,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.temperatureMin,
    required this.temperatureMax,
    required this.seaLevel,
    required this.groundLevel,
  });

  factory Main.fromJson(Map<String, dynamic> json) => _$MainFromJson(json);

  Map<String, dynamic> toJson() => _$MainToJson(this);
}
