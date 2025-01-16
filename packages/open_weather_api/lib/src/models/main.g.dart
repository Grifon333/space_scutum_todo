// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Main _$MainFromJson(Map<String, dynamic> json) => Main(
      temperature: (json['temp'] as num).toDouble(),
      feelsLike: (json['feels_like'] as num).toDouble(),
      pressure: (json['pressure'] as num).toInt(),
      humidity: (json['humidity'] as num).toInt(),
      temperatureMin: (json['temp_min'] as num).toDouble(),
      temperatureMax: (json['temp_max'] as num).toDouble(),
      seaLevel: (json['sea_level'] as num).toInt(),
      groundLevel: (json['grnd_level'] as num).toInt(),
    );

Map<String, dynamic> _$MainToJson(Main instance) => <String, dynamic>{
      'temp': instance.temperature,
      'feels_like': instance.feelsLike,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
      'temp_min': instance.temperatureMin,
      'temp_max': instance.temperatureMax,
      'sea_level': instance.seaLevel,
      'grnd_level': instance.groundLevel,
    };
