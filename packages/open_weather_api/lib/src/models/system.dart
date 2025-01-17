import 'package:json_annotation/json_annotation.dart';

part 'system.g.dart';

@JsonSerializable()
class System {
  /// Internal parameter
  int? type;

  /// Internal parameter
  int? id;

  /// Country code (GB, JP etc.)
  String country;

  /// Sunrise time, unix, UTC
  int sunrise;

  /// Sunset time, unix, UTC
  int sunset;

  System({
    this.type,
    this.id,
    required this.country,
    required this.sunrise,
    required this.sunset,
  });

  factory System.fromJson(Map<String, dynamic> json) => _$SystemFromJson(json);

  Map<String, dynamic> toJson() => _$SystemToJson(this);
}
