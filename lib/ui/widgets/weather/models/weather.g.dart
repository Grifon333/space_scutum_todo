// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weather _$WeatherFromJson(Map<String, dynamic> json) => Weather(
      location: json['location'] as String,
      temperature:
          Temperature.fromJson(json['temperature'] as Map<String, dynamic>),
      condition: json['condition'] as String,
      wind: Wind.fromJson(json['wind'] as Map<String, dynamic>),
      icon: json['icon'] as String,
      lastUpdate: DateTime.parse(json['lastUpdate'] as String),
    );

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'location': instance.location,
      'temperature': instance.temperature,
      'condition': instance.condition,
      'wind': instance.wind,
      'icon': instance.icon,
      'lastUpdate': instance.lastUpdate.toIso8601String(),
    };
