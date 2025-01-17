import 'package:test/test.dart';
import 'package:todos_api/todos_api.dart';

void main() {
  group('Todo', () {
    Todo createSubject({
      String? id = '1',
      String title = 'Title',
      String description = 'Description',
      String category = 'home',
      bool isCompleted = true,
    }) =>
        Todo(
          id: id,
          title: title,
          description: description,
          category: category,
          isCompleted: isCompleted,
        );

    group('constructor', () {
      test('work correctly', () {
        expect(createSubject, returnsNormally);
      });

      test(
        'throw AssertionError when id is empty',
        () {
          expect(
            () => createSubject(id: ''),
            throwsA(isA<AssertionError>()),
          );
        },
      );

      test('sets id if not provided', () {
        expect(createSubject(id: null).id, isNotEmpty);
      });

      test('supports value equality', () {
        expect(createSubject(), equals(createSubject()));
      });

      test('props are correct', () {
        expect(
          createSubject().props,
          equals(['1', 'Title', 'Description', 'home', true]),
        );
      });

      group('copyWith', () {
        test('returns the same object if not arguments are provided', () {
          expect(createSubject().copyWith(), equals(createSubject()));
        });

        test(
          'retains the old value for every parameters if null is provided',
          () {
            expect(
              createSubject().copyWith(
                id: null,
                title: null,
                description: null,
                category: null,
                isCompleted: null,
              ),
              equals(createSubject()),
            );
          },
        );

        test(
          'replaces every non-null parameter',
          () {
            expect(
              createSubject().copyWith(
                id: '2',
                title: 'new title',
                description: 'new description',
                isCompleted: false,
              ),
              equals(
                createSubject(
                  id: '2',
                  title: 'new title',
                  description: 'new description',
                  isCompleted: false,
                ),
              ),
            );
          },
        );
      });
    });

    group('fromJson', () {
      test('works correctly', () {
        expect(
          Todo.fromJson(<String, dynamic>{
            'id': '1',
            'title': 'Title',
            'description': 'Description',
            'category': 'home',
            'isCompleted': true,
          }),
          equals(createSubject()),
        );
      });
    });

    group('toJson', () {
      test('works correctly', () {
        expect(
          createSubject().toJson(),
          equals(<String, dynamic>{
            'id': '1',
            'title': 'Title',
            'description': 'Description',
            'category': 'home',
            'isCompleted': true,
          }),
        );
      });
    });
  });
}
