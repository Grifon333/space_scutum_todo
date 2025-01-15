part of 'task_details_bloc.dart';

enum TaskDetailsStatus { initial, loading, success, failure }

extension TaskDetailsStatusLoadingOrSuccess on TaskDetailsStatus {
  bool get isLoadingOrSuccess =>
      this == TaskDetailsStatus.loading || this == TaskDetailsStatus.success;
}

final class TaskDetailsState extends Equatable {
  final TaskDetailsStatus status;
  final Todo? initTask;
  final String title;
  final String description;
  final String category;

  const TaskDetailsState({
    this.status = TaskDetailsStatus.initial,
    this.initTask,
    this.title = '',
    this.description = '',
    this.category = '',
  });

  bool get isNewTask => initTask == null;

  TaskDetailsState copyWith({
    TaskDetailsStatus? status,
    Todo? initTask,
    String? title,
    String? description,
    String? category,
  }) {
    return TaskDetailsState(
      status: status ?? this.status,
      initTask: initTask ?? this.initTask,
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category,
    );
  }

  @override
  List<Object?> get props => [status, initTask, title, description, category];
}
