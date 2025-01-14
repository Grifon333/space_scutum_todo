import 'package:todos_api/src/models/todo.dart';

abstract class TodosApi {
  const TodosApi();

  Stream<List<Todo>> getTodos();

  Future<void> saveTodo(Todo todo);

  // throw TodoNotFoundException
  Future<void> deleteTodo(String id);

  Future<void> close();
}

class TodoNotFoundException implements Exception {}
