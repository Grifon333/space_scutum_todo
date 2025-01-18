import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:todos_api/todos_api.dart';
import 'package:todos_repository/todos_repository.dart';

class MockTodosApi extends Mock implements TodosApi {}

class FakeTodo extends Fake implements Todo {}

void main() {
  group('TodosRepository', () {
    late TodosApi api;
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

    setUpAll(() => registerFallbackValue(FakeTodo()));

    setUp(() {
      api = MockTodosApi();
      when(() => api.getTodos()).thenAnswer((_) => Stream.value(todos));
      when(() => api.saveTodo(any())).thenAnswer((_) async {});
      when(() => api.deleteTodo(any())).thenAnswer((_) async {});
    });

    TodosRepository createSubject() => TodosRepository(todosApi: api);

    group('constructor', () {
      test('works properly', () => expect(createSubject, returnsNormally));
    });

    group('getTodos', () {
      test('make correct api request', () {
        final subject = createSubject();
        expect(subject.getTodos(), isNot(throwsA(anything)));
        verify(() => api.getTodos()).called(1);
      });

      test('returns stream of current list todos', () {
        expect(createSubject().getTodos(), emits(todos));
      });
    });

    group('saveTodo', () {
      test('make correct api request', () {
        final newTodo = Todo(
          id: '4',
          title: 'Title 4',
          description: 'description 4',
        );
        final subject = createSubject();
        expect(subject.saveTodo(newTodo), completes);
        verify(() => api.saveTodo(newTodo)).called(1);
      });
    });

    group('deleteTodo', () {
      test('makes correct api request', () {
        final subject = createSubject();
        expect(subject.deleteTodo(todos[0].id), completes);
        verify(() => api.deleteTodo(todos[0].id)).called(1);
      });
    });
  });
}
