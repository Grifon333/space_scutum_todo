import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todos_repository/todos_repository.dart';

class App extends StatelessWidget {
  final TodosRepository todosRepository;

  const App({super.key, required this.todosRepository});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: todosRepository,
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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Scaffold(body: Center(child: Text('Space Scutum ToDo'))),
    );
  }
}
