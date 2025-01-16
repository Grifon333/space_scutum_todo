import 'package:json_annotation/json_annotation.dart';

part 'system.g.dart';

@JsonSerializable()
class System {
  int? type;
  int? id;
  String country;
  int sunrise;
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
