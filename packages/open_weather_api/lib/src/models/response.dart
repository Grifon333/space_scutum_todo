import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'response.g.dart';

@JsonSerializable()
class Response {
  @JsonKey(name: 'coord')
  Coordinates coordinates;
  List<Weather> weather;
  String base;
  Main main;
  int visibility;
  Wind wind;
  Clouds clouds;
  @JsonKey(name: 'dt')
  int dateTime;
  @JsonKey(name: 'sys')
  System system;
  int timezone;
  int id;
  String name;
  @JsonKey(name: 'cod')
  int code;

  Response({
    required this.coordinates,
    required this.weather,
    required this.base,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.clouds,
    required this.dateTime,
    required this.system,
    required this.timezone,
    required this.id,
    required this.name,
    required this.code,
  });

  factory Response.fromJson(Map<String, dynamic> json) => _$ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseToJson(this);
}
