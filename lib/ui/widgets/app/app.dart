import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_scutum_todo/ui/theme/main_theme.dart';
import 'package:space_scutum_todo/ui/widgets/home/home.dart';
import 'package:todos_repository/todos_repository.dart';
import 'package:weather_repository/weather_repository.dart';

class App extends StatelessWidget {
  final TodosRepository _todosRepository;
  final WeatherRepository _weatherRepository;

  const App({
    super.key,
    required TodosRepository todosRepository,
    required WeatherRepository weatherRepository,
  })  : _todosRepository = todosRepository,
        _weatherRepository = weatherRepository;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        RepositoryProvider.value(value: _todosRepository),
        RepositoryProvider.value(value: _weatherRepository),
      ],
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Space Scutum ToDo',
      theme: MainTheme.light,
      home: const HomePage(),
    );
  }
}
