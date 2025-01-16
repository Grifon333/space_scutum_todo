// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weather _$WeatherFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Weather',
      json,
      ($checkedConvert) {
        final val = Weather(
          location: $checkedConvert('location', (v) => v as String),
          temperature:
              $checkedConvert('temperature', (v) => (v as num).toDouble()),
          temperatureMin:
              $checkedConvert('temperature_min', (v) => (v as num).toDouble()),
          temperatureMax:
              $checkedConvert('temperature_max', (v) => (v as num).toDouble()),
          weatherType: $checkedConvert('weather_type', (v) => v as String),
          windSpeed:
              $checkedConvert('wind_speed', (v) => (v as num).toDouble()),
          windDirection:
              $checkedConvert('wind_direction', (v) => (v as num).toInt()),
        );
        return val;
      },
      fieldKeyMap: const {
        'temperatureMin': 'temperature_min',
        'temperatureMax': 'temperature_max',
        'weatherType': 'weather_type',
        'windSpeed': 'wind_speed',
        'windDirection': 'wind_direction'
      },
    );

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'location': instance.location,
      'temperature': instance.temperature,
      'temperature_min': instance.temperatureMin,
      'temperature_max': instance.temperatureMax,
      'weather_type': instance.weatherType,
      'wind_speed': instance.windSpeed,
      'wind_direction': instance.windDirection,
    };
