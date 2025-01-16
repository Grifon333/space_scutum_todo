part of 'tasks_bloc.dart';

enum TasksStatus { initial, loading, success, failure }

final class TasksState extends Equatable {
  final TasksStatus status;
  final List<Todo> tasks;
  final Set<String> categories;
  final String? selectCategory;
  final TasksFilter filter;

  const TasksState({
    this.status = TasksStatus.initial,
    this.tasks = const [],
    this.categories = const {},
    this.selectCategory,
    this.filter = TasksFilter.all,
  });

  Iterable<Todo> get filteredTasks =>
      filter.applyAll(tasks, category: selectCategory);

  @override
  List<Object?> get props => [
        status,
        tasks,
        categories,
        selectCategory,
        filter,
      ];

  TasksState copyWith({
    TasksStatus? status,
    List<Todo>? tasks,
    Set<String>? categories,
    String? selectCategory,
    TasksFilter? filter,
  }) {
    return TasksState(
      status: status ?? this.status,
      tasks: tasks ?? this.tasks,
      categories: categories ?? this.categories,
      selectCategory: selectCategory ?? this.selectCategory,
      filter: filter ?? this.filter,
    );
  }
}
