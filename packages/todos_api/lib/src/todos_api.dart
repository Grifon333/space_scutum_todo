import 'package:todos_api/src/models/todo.dart';

/// Interface for the API that provides access to the to-do list.
abstract class TodosApi {
  const TodosApi();

  /// Returns the stream of todos, updating it whenever the data changes
  Stream<List<Todo>> getTodos();

  /// Saves a new or updated todo.
  ///
  /// - `todo`: The [Todo] object to save.
  Future<void> saveTodo(Todo todo);

  /// Deletes a todo by its unique identifier.
  ///
  /// Throws:
  /// - `TodoNotFoundException` if the todo with the given `ID` is not found.
  Future<void> deleteTodo(String id);

  /// Closes the API and releases any resources.
  Future<void> close();
}

/// Exception thrown when trying to delete a non-existent [Todo].
class TodoNotFoundException implements Exception {}
