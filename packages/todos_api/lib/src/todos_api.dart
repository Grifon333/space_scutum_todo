import 'package:todos_api/src/models/todo.dart';

/// {@template todos_api}
/// A Very Good Project created by Very Good CLI.
/// {@endtemplate}
abstract class TodosApi {
  /// {@macro todos_api}
  const TodosApi();

  Stream<List<Todo>> getTodos();

  Future<void> seveTodo(Todo todo);

  // throw TodoNotFoundException
  Future<void> deleteTodo(String id);

  Future<void> close();
}

class TodoNotFoundException implements Exception {}
