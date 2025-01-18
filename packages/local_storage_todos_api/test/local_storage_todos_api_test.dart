import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:local_storage_todos_api/local_storage_todos_api.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todos_api/todos_api.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  group('LocalStorageTodosApi', () {
    late SharedPreferences storage;
    final todos = [
      Todo(
        id: '1',
        title: 'Title 1',
        description: 'description 1',
        category: 'home',
      ),
      Todo(
        id: '2',
        title: 'Title 2',
        description: 'some description 2',
      ),
      Todo(
        id: '3',
        title: 'title 3',
        description: 'description 3',
        isCompleted: true,
      ),
    ];

    setUp(() {
      storage = MockSharedPreferences();
      when(() => storage.getString(any())).thenReturn(json.encode(todos));
      when(() => storage.setString(any(), any())).thenAnswer((_) async => true);
    });

    LocalStorageTodosApi createSubject() {
      return LocalStorageTodosApi(storage: storage);
    }

    group('constructor', () {
      test('works properly', () => expect(createSubject, returnsNormally));

      group('initializes the todos stream', () {
        test('with existing todos is present', () {
          final subject = createSubject();
          expect(subject.getTodos(), emits(todos));
          verify(
            () => storage.getString(LocalStorageTodosApi.kTodosCollectionKey),
          ).called(1);
        });

        test('with empty list if no todos present', () {
          when(() => storage.getString(any())).thenReturn(null);
          final subject = createSubject();
          expect(subject.getTodos(), emits(const <Todo>[]));
          verify(
            () => storage.getString(LocalStorageTodosApi.kTodosCollectionKey),
          ).called(1);
        });
      });
    });

    test('getTodos returns stream of current list todos', () {
      expect(createSubject().getTodos(), emits(todos));
    });

    group('saveTodo', () {
      test('save new todos', () {
        final newTodo = Todo(
          id: '4',
          title: 'Title 4',
          description: 'description 4',
          category: 'work',
        );
        final newTodos = [...todos, newTodo];
        final subject = createSubject();
        expect(subject.saveTodo(newTodo), completes);
        expect(subject.getTodos(), emits(newTodos));
        verify(
          () => storage.setString(
            LocalStorageTodosApi.kTodosCollectionKey,
            json.encode(newTodos),
          ),
        ).called(1);
      });

      test('updates existing todos', () {
        final updateTodo = Todo(
          id: '1',
          title: 'Title 1',
          description: 'some description 11',
          category: 'family',
          isCompleted: true,
        );
        final newTodos = [updateTodo, ...todos.sublist(1)];
        final subject = createSubject();
        expect(subject.saveTodo(updateTodo), completes);
        expect(subject.getTodos(), emits(newTodos));
        verify(
          () => storage.setString(
            LocalStorageTodosApi.kTodosCollectionKey,
            json.encode(newTodos),
          ),
        ).called(1);
      });
    });

    group('deleteTodo', () {
      test('deletes existing todos', () {
        final newTodos = todos.sublist(1);
        final subject = createSubject();
        expect(subject.deleteTodo(todos[0].id), completes);
        expect(subject.getTodos(), emits(newTodos));
        verify(
          () => storage.setString(
            LocalStorageTodosApi.kTodosCollectionKey,
            json.encode(newTodos),
          ),
        ).called(1);
      });

      test(
        'throws TodoNotFoundException if todo with provided id id not found',
        () {
          final subject = createSubject();
          expect(
            () => subject.deleteTodo('non-existing-id'),
            throwsA(isA<TodoNotFoundException>()),
          );
        },
      );
    });

    group('close', () {
      test('closes the instance', () async {
        final subject = createSubject();
        await subject.close();
        expect(() => subject.saveTodo(Todo(title: 'title')), throwsStateError);
      });
    });
  });
}
