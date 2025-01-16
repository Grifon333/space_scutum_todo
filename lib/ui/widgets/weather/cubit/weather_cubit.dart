import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:space_scutum_todo/ui/widgets/weather/models/models.dart';
import 'package:weather_repository/weather_repository.dart'
    show WeatherRepository;

part 'weather_cubit.g.dart';
part 'weather_state.dart';

class WeatherCubit extends HydratedCubit<WeatherState> {
  final WeatherRepository _weatherRepository;

  WeatherCubit(this._weatherRepository) : super(WeatherState());

  Future<void> fetchWeather(String? city) async {
    if (city == null || city.isEmpty) return;
    emit(state.copyWith(status: WeatherStatus.loading));
    try {
      final weather = Weather.fromRepository(
        await _weatherRepository.getWeather(city),
      );
      emit(state.copyWith(status: WeatherStatus.success, weather: weather));
    } on Equatable {
      emit(state.copyWith(status: WeatherStatus.failure));
    }
  }

  Future<void> refreshWeather() async {
    if (state.status != WeatherStatus.success ||
        state.weather == Weather.empty) {
      return;
    }
    try {
      final weather = Weather.fromRepository(
        await _weatherRepository.getWeather(state.weather.location),
      );
      emit(state.copyWith(status: WeatherStatus.success, weather: weather));
    } on Exception {
      emit(state);
    }
  }

  @override
  WeatherState? fromJson(Map<String, dynamic> json) => WeatherState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(WeatherState state) => state.toJson();
}
