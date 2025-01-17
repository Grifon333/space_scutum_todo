import 'package:json_annotation/json_annotation.dart';

part 'wind.g.dart';

@JsonSerializable()
class Wind {
  /// Wind speed. Unit Default: meter/sec, Metric: meter/sec, Imperial: miles/hour
  double speed;
  /// Wind direction, degrees (meteorological)
  @JsonKey(name: 'deg')
  int direction;
  /// Wind gust. Unit Default: meter/sec, Metric: meter/sec, Imperial: miles/hour
  double? gust;

  Wind({
    required this.speed,
    required this.direction,
    this.gust,
  });

  factory Wind.fromJson(Map<String, dynamic> json) => _$WindFromJson(json);

  Map<String, dynamic> toJson() => _$WindToJson(this);
}
