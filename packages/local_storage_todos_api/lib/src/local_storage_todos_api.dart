import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:rxdart/subjects.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todos_api/todos_api.dart';
import 'package:meta/meta.dart';

/// A Flutter implementation of the [TodosApi] that uses local storage.
class LocalStorageTodosApi extends TodosApi {
  final SharedPreferences _storage;
  late final _todoStreamController = BehaviorSubject<List<Todo>>.seeded(
    const [],
  );

  /// Key for accessing the todos collection in SharedPreferences.
  ///
  /// It is available for testing purposes only and should not be used by users of this library.
  @visibleForTesting
  static const kTodosCollectionKey = '__todos_collections_key__';

  LocalStorageTodosApi({required SharedPreferences storage})
      : _storage = storage {
    _init();
  }

  void _init() {
    final todosJson = _getValue(kTodosCollectionKey);
    if (todosJson == null) {
      _todoStreamController.add(const []);
      return;
    }
    final todos =
        List<Map<String, dynamic>>.from(json.decode(todosJson) as List)
            .map((jsonMap) => Todo.fromJson(Map<String, dynamic>.from(jsonMap)))
            .toList();
    _todoStreamController.add(todos);
  }

  String? _getValue(String key) => _storage.getString(key);

  Future<void> _setValue(String key, String value) =>
      _storage.setString(key, value);

  @override
  Stream<List<Todo>> getTodos() => _todoStreamController.asBroadcastStream();

  @override
  Future<void> saveTodo(Todo todo) {
    final todos = [..._todoStreamController.value];
    final todoIndex = todos.indexWhere((t) => t.id == todo.id);
    if (todoIndex != -1) {
      todos[todoIndex] = todo;
    } else {
      todos.add(todo);
    }
    _todoStreamController.add(todos);
    return _setValue(kTodosCollectionKey, json.encode(todos));
  }

  @override
  Future<void> deleteTodo(String id) {
    final todos = [..._todoStreamController.value];
    final todoIndex = todos.indexWhere((t) => t.id == id);
    if (todoIndex == -1) throw TodoNotFoundException();
    todos.removeAt(todoIndex);
    _todoStreamController.add(todos);
    return _setValue(kTodosCollectionKey, json.encode(todos));
  }

  @override
  Future<void> close() => _todoStreamController.close();
}
