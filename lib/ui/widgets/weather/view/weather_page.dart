import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_scutum_todo/ui/widgets/weather/cubit/weather_cubit.dart';
import 'package:space_scutum_todo/ui/widgets/weather/models/models.dart';
import 'package:space_scutum_todo/ui/widgets/weather/widgets/widgets.dart';
import 'package:weather_repository/weather_repository.dart'
    show WeatherRepository;

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather'),
      ),
      backgroundColor: Colors.black,
      body: BlocProvider(
        create: (context) => WeatherCubit(context.read<WeatherRepository>()),
        child: BlocBuilder<WeatherCubit, WeatherState>(
          builder: (context, state) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: WeatherView(weather: state.weather),
              ),
            );
          },
        ),
      ),
    );
  }
}

class WeatherView extends StatelessWidget {
  final Weather weather;

  const WeatherView({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: context.read<WeatherCubit>().refreshWeather,
      child: Column(
        spacing: 16,
        children: [
          SearchForm(),
          CountryName(location: weather.location),
          ConditionIcon(),
          ConditionTitle(condition: weather.condition),
          TemperatureBoard(temperature: weather.temperature),
          WindBoard(wind: weather.wind),
        ],
      ),
    );
  }
}
