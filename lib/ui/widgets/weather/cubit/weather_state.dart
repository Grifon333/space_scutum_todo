part of 'weather_cubit.dart';

enum WeatherStatus { initial, loading, success, failure }

@JsonSerializable()
final class WeatherState extends Equatable {
  final WeatherStatus status;
  final Weather weather;

  WeatherState({
    this.status = WeatherStatus.initial,
    Weather? weather,
  }) : weather = weather ?? Weather.empty;

  @override
  List<Object> get props => [status, weather];

  WeatherState copyWith({
    WeatherStatus? status,
    Weather? weather,
  }) {
    return WeatherState(
      status: status ?? this.status,
      weather: weather ?? this.weather,
    );
  }

  factory WeatherState.fromJson(Map<String, dynamic> json) =>
      _$WeatherStateFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherStateToJson(this);
}
