import 'package:todos_repository/todos_repository.dart';

enum TasksFilter { all, complete, active, category }

extension SimpleFilter on TasksFilter {
  bool apply(Todo task, {String? category}) => switch (this) {
        TasksFilter.all => true,
        TasksFilter.complete => task.isCompleted,
        TasksFilter.active => !task.isCompleted,
        TasksFilter.category => category != null && task.category == category,
      };

  Iterable<Todo> applyAll(Iterable<Todo> tasks, {String? category}) =>
      tasks.where(apply);
}
