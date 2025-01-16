import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_scutum_todo/ui/widgets/weather/cubit/weather_cubit.dart';
import 'package:space_scutum_todo/ui/widgets/weather/models/models.dart';
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
      body: BlocProvider(
        create: (context) => WeatherCubit(context.read<WeatherRepository>()),
        child: BlocBuilder<WeatherCubit, WeatherState>(
          builder: (context, state) {
            // if (state.status != WeatherStatus.success) return SizedBox();
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
          Text(weather.location),
          Text(weather.condition),
          TemperatureBoard(temperature: weather.temperature),
          WindBoard(wind: weather.wind),
        ],
      ),
    );
  }
}

class SearchForm extends StatefulWidget {
  const SearchForm({super.key});

  @override
  State<SearchForm> createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm> {
  final TextEditingController _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'City',
            ),
            controller: _textController,
          ),
        ),
        IconButton(
          onPressed: () =>
              context.read<WeatherCubit>().fetchWeather(_textController.text),
          icon: Icon(Icons.search),
        ),
      ],
    );
  }
}

class TemperatureBoard extends StatelessWidget {
  final Temperature temperature;

  const TemperatureBoard({super.key, required this.temperature});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Temperature'),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text('Current:'),
                Text('${temperature.current}'),
              ],
            ),
            Column(
              children: [
                Text('Min:'),
                Text('${temperature.min}'),
              ],
            ),
            Column(
              children: [
                Text('Max:'),
                Text('${temperature.max}'),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class WindBoard extends StatelessWidget {
  final Wind wind;

  const WindBoard({super.key, required this.wind});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Wind'),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text('Speed:'),
                Text('${wind.speed}'),
              ],
            ),
            Column(
              children: [
                Text('Direction:'),
                Text('${wind.direction}'),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
