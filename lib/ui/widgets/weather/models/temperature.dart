import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'temperature.g.dart';

@JsonSerializable()
class Temperature extends Equatable {
  final double current;
  final double min;
  final double max;

  const Temperature({
    required this.current,
    required this.min,
    required this.max,
  });

  factory Temperature.fromJson(Map<String, dynamic> json) =>
      _$TemperatureFromJson(json);

  Map<String, dynamic> toJson() => _$TemperatureToJson(this);

  static const empty = Temperature(current: 0, min: 0, max: 0);

  @override
  List<Object> get props => [current, min, max];
}
