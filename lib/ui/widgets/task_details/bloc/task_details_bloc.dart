import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:todos_repository/todos_repository.dart';

part 'task_details_event.dart';

part 'task_details_state.dart';

class TaskDetailsBloc extends Bloc<TaskDetailsEvent, TaskDetailsState> {
  final TodosRepository _todosRepository;

  TaskDetailsBloc({
    required TodosRepository todosRepository,
    Todo? initTask,
  })  : _todosRepository = todosRepository,
        super(TaskDetailsState(
          initTask: initTask,
          title: initTask?.title ?? '',
          description: initTask?.description ?? '',
          category: initTask?.category ?? '',
        )) {
    on<TaskDetailsTitleChanged>(_onTitleChanged);
    on<TaskDetailsDescriptionChanged>(_onDescriptionChanged);
    on<TaskDetailsCategoryChanged>(_onCategoryChanged);
    on<TaskDetailsSubmitted>(_onSubmitted);
  }

  _onTitleChanged(
    TaskDetailsTitleChanged event,
    Emitter<TaskDetailsState> emit,
  ) {
    emit(state.copyWith(title: event.title));
  }

  _onDescriptionChanged(
    TaskDetailsDescriptionChanged event,
    Emitter<TaskDetailsState> emit,
  ) {
    emit(state.copyWith(description: event.description));
  }

  _onCategoryChanged(
    TaskDetailsCategoryChanged event,
    Emitter<TaskDetailsState> emit,
  ) {
    emit(state.copyWith(category: event.category));
  }

  Future<void> _onSubmitted(
    TaskDetailsSubmitted event,
    Emitter<TaskDetailsState> emit,
  ) async {
    emit(state.copyWith(status: TaskDetailsStatus.loading));
    final todo = (state.initTask ?? Todo(title: '')).copyWith(
      title: state.title,
      description: state.description,
      category: state.category,
    );
    try {
      await _todosRepository.saveTodo(todo);
      emit(state.copyWith(status: TaskDetailsStatus.success));
    } catch (e) {
      emit(state.copyWith(status: TaskDetailsStatus.failure));
    }
  }
}
