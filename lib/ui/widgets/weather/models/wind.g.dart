// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wind.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Wind _$WindFromJson(Map<String, dynamic> json) => Wind(
      speed: (json['speed'] as num).toDouble(),
      direction: (json['direction'] as num).toInt(),
    );

Map<String, dynamic> _$WindToJson(Wind instance) => <String, dynamic>{
      'speed': instance.speed,
      'direction': instance.direction,
    };
