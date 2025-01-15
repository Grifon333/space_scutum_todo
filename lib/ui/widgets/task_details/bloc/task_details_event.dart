part of 'task_details_bloc.dart';

@immutable
sealed class TaskDetailsEvent extends Equatable {
  const TaskDetailsEvent();

  @override
  List<Object> get props => [];
}

class TaskDetailsTitleChanged extends TaskDetailsEvent {
  final String title;

  const TaskDetailsTitleChanged(this.title);

  @override
  List<Object> get props => [title];
}

class TaskDetailsDescriptionChanged extends TaskDetailsEvent {
  final String description;

  const TaskDetailsDescriptionChanged(this.description);

  @override
  List<Object> get props => [description];
}

class TaskDetailsCategoryChanged extends TaskDetailsEvent {
  final String category;

  const TaskDetailsCategoryChanged(this.category);

  @override
  List<Object> get props => [category];
}

class TaskDetailsSubmitted extends TaskDetailsEvent {
  const TaskDetailsSubmitted();
}
