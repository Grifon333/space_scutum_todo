part of 'weather_cubit.dart';

enum WeatherStatus { initial, loading, success, failure }

@JsonSerializable()
final class WeatherState extends Equatable {
  final WeatherStatus status;
  final Weather weather;
  final String imageBytes;

  WeatherState({
    this.status = WeatherStatus.initial,
    Weather? weather,
    String? imageBytes,
  })  : weather = weather ?? Weather.empty,
        imageBytes = imageBytes ?? '';

  @override
  List<Object> get props => [status, weather, imageBytes];

  factory WeatherState.fromJson(Map<String, dynamic> json) =>
      _$WeatherStateFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherStateToJson(this);

  WeatherState copyWith({
    WeatherStatus? status,
    Weather? weather,
    String? imageBytes,
  }) {
    return WeatherState(
      status: status ?? this.status,
      weather: weather ?? this.weather,
      imageBytes: imageBytes ?? this.imageBytes,
    );
  }
}
