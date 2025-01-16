part of 'tasks_bloc.dart';

@immutable
sealed class TasksEvent extends Equatable {
  const TasksEvent();

  @override
  List<Object?> get props => [];
}

class TasksSubscriptionRequired extends TasksEvent {
  const TasksSubscriptionRequired();
}

class TasksCompletionToggled extends TasksEvent {
  final Todo task;
  final bool isCompleted;

  const TasksCompletionToggled({
    required this.task,
    required this.isCompleted,
  });

  @override
  List<Object> get props => [task, isCompleted];
}

class TasksTaskDeleted extends TasksEvent {
  final Todo task;

  const TasksTaskDeleted(this.task);

  @override
  List<Object> get props => [task];
}

class TasksFilterChanged extends TasksEvent {
  final TasksFilter filter;
  final String? selectCategory;

  const TasksFilterChanged(this.filter, this.selectCategory);

  @override
  List<Object?> get props => [filter, selectCategory];
}
