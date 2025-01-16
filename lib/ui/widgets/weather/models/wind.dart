import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'wind.g.dart';

@JsonSerializable()
class Wind extends Equatable {
  final double speed;
  final int direction;

  const Wind({
    required this.speed,
    required this.direction,
  });

  factory Wind.fromJson(Map<String, dynamic> json) => _$WindFromJson(json);

  Map<String, dynamic> toJson() => _$WindToJson(this);

  static const empty = Wind(speed: 0, direction: 0);

  @override
  List<Object> get props => [speed, direction];
}
