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
          temperatureCurrent: $checkedConvert(
              'temperature_current', (v) => (v as num).toDouble()),
          temperatureMin:
              $checkedConvert('temperature_min', (v) => (v as num).toDouble()),
          temperatureMax:
              $checkedConvert('temperature_max', (v) => (v as num).toDouble()),
          condition: $checkedConvert('condition', (v) => v as String),
          windSpeed:
              $checkedConvert('wind_speed', (v) => (v as num).toDouble()),
          windDirection:
              $checkedConvert('wind_direction', (v) => (v as num).toInt()),
          icon: $checkedConvert('icon', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {
        'temperatureCurrent': 'temperature_current',
        'temperatureMin': 'temperature_min',
        'temperatureMax': 'temperature_max',
        'windSpeed': 'wind_speed',
        'windDirection': 'wind_direction'
      },
    );

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'location': instance.location,
      'temperature_current': instance.temperatureCurrent,
      'temperature_min': instance.temperatureMin,
      'temperature_max': instance.temperatureMax,
      'condition': instance.condition,
      'wind_speed': instance.windSpeed,
      'wind_direction': instance.windDirection,
      'icon': instance.icon,
    };
