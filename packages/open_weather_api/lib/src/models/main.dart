import 'package:json_annotation/json_annotation.dart';

part 'main.g.dart';

@JsonSerializable()
class Main {
  @JsonKey(name: 'temp')
  double temperature;
  @JsonKey(name: 'feels_like')
  double feelsLike;
  int pressure;
  int humidity;
  @JsonKey(name: 'temp_min')
  double temperatureMin;
  @JsonKey(name: 'temp_max')
  double temperatureMax;
  @JsonKey(name: 'sea_level')
  int seaLevel;
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
