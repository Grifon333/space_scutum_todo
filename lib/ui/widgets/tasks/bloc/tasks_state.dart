part of 'tasks_bloc.dart';

enum TasksStatus { initial, loading, success, failure }

final class TasksState extends Equatable {
  final TasksStatus status;
  final List<Todo> tasks;
  final TasksFilter filter;
  final String? selectCategory;

  const TasksState({
    this.status = TasksStatus.initial,
    this.tasks = const [],
    this.filter = TasksFilter.all,
    this.selectCategory,
  });

  Iterable<Todo> get filteredTasks => filter.applyAll(tasks);

  TasksState copyWith({
    TasksStatus? status,
    List<Todo>? tasks,
    TasksFilter? filter,
    String? selectCategory,
  }) {
    return TasksState(
      status: status ?? this.status,
      tasks: tasks ?? this.tasks,
      filter: filter ?? this.filter,
      selectCategory: selectCategory ?? this.selectCategory,
    );
  }

  @override
  List<Object?> get props => [status, tasks, filter, selectCategory];
}
