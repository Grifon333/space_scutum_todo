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
      appBar: AppBar(title: Text('Weather')),
      body: BlocProvider(
        create: (context) => WeatherCubit(context.read<WeatherRepository>()),
        child: BlocBuilder<WeatherCubit, WeatherState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  SearchForm(),
                  SizedBox(height: 16),
                  WeatherViewBuilder(state: state),
                  Spacer(),
                  LastUpdateTime(lastUpdate: state.weather.lastUpdate),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class WeatherViewBuilder extends StatelessWidget {
  final WeatherState state;

  const WeatherViewBuilder({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(color: Colors.white, fontSize: 18);
    return Builder(
      builder: (context) => switch (state.status) {
        WeatherStatus.initial => Text('Please, select the City', style: style),
        WeatherStatus.loading => Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 8,
            children: [
              CircularProgressIndicator(),
              Text('Loading weather', style: style),
            ],
          ),
        WeatherStatus.success => WeatherSuccessView(weather: state.weather),
        WeatherStatus.failure => Text('An error occurred', style: style),
      },
    );
  }
}

class WeatherSuccessView extends StatelessWidget {
  final Weather weather;

  const WeatherSuccessView({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: context.read<WeatherCubit>().refreshWeather,
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        clipBehavior: Clip.none,
        child: Column(
          spacing: 16,
          children: [
            CountryName(location: weather.location),
            ConditionIcon(),
            ConditionTitle(condition: weather.condition),
            TemperatureBoard(temperature: weather.temperature),
            WindBoard(wind: weather.wind),
          ],
        ),
      ),
    );
  }
}
