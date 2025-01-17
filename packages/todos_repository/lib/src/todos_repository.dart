import 'package:todos_api/todos_api.dart';

/// A repository that handles `todo` related requests.
class TodosRepository {
  final TodosApi _todosApi;

  const TodosRepository({required TodosApi todosApi}) : _todosApi = todosApi;

  /// Returns the stream of todos, updating it whenever the data changes
  Stream<List<Todo>> getTodos() => _todosApi.getTodos();

  /// Saves a new or updated todo.
  ///
  /// - `todo`: The [Todo] object to save.
  Future<void> saveTodo(Todo todo) => _todosApi.saveTodo(todo);

  /// Deletes a todo by its unique identifier.
  ///
  /// Throws:
  /// - `TodoNotFoundException` if the todo with the given `ID` is not found.
  Future<void> deleteTodo(String id) => _todosApi.deleteTodo(id);
}
