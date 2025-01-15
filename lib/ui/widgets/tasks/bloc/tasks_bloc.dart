import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:space_scutum_todo/ui/widgets/tasks/tasks.dart';
import 'package:todos_repository/todos_repository.dart';
import "package:meta/meta.dart";

part 'tasks_event.dart';

part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  final TodosRepository _repository;

  TasksBloc({
    required TodosRepository repository,
  })  : _repository = repository,
        super(TasksState()) {
    on<TasksSubscriptionRequired>(_onSubscriptionRequired);
    on<TasksCompletionToggled>(_onCompletionToggled);
    on<TasksTaskDeleted>(_onTaskDeleted);
    on<TasksFilterChanged>(_onFilterChanged);
  }

  Future<void> _onSubscriptionRequired(
    TasksSubscriptionRequired event,
    Emitter<TasksState> emit,
  ) async {
    emit(state.copyWith(status: TasksStatus.loading));
    await emit.forEach<List<Todo>>(
      _repository.getTodos(),
      onData: (tasks) => state.copyWith(
        status: TasksStatus.success,
        tasks: tasks,
      ),
      onError: (_, __) => state.copyWith(status: TasksStatus.failure),
    );
  }

  Future<void> _onCompletionToggled(
    TasksCompletionToggled event,
    Emitter<TasksState> emit,
  ) async {
    final newTask = event.task.copyWith(isCompleted: event.isCompleted);
    await _repository.saveTodo(newTask);
  }

  Future<void> _onTaskDeleted(
    TasksTaskDeleted event,
    Emitter<TasksState> emit,
  ) async {
    await _repository.deleteTodo(event.task.id);
  }

  void _onFilterChanged(
    TasksFilterChanged event,
    Emitter<TasksState> emit,
  ) {
    emit(state.copyWith(filter: event.filter));
  }
}
