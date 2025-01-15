import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_scutum_todo/ui/widgets/task_details/bloc/task_details_bloc.dart';
import 'package:space_scutum_todo/ui/widgets/task_details/widgets/widgets.dart';
import 'package:todos_repository/todos_repository.dart';

class TaskDetailsPage extends StatelessWidget {
  const TaskDetailsPage({super.key});

  static Route<void> route({Todo? initTask}) {
    return MaterialPageRoute(
      builder: (_) => BlocProvider(
        create: (context) => TaskDetailsBloc(
          todosRepository: context.read<TodosRepository>(),
          initTask: initTask,
        ),
        child: const TaskDetailsPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TaskDetailsBloc, TaskDetailsState>(
      listener: (context, state) => Navigator.of(context).pop(),
      listenWhen: (prev, curr) =>
          prev.status != curr.status &&
          curr.status == TaskDetailsStatus.success,
      child: const TaskDetailsView(),
    );
  }
}

class TaskDetailsView extends StatelessWidget {
  const TaskDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final isNewTask =
        context.select((TaskDetailsBloc bloc) => bloc.state.isNewTask);
    return Scaffold(
      appBar: AppBar(
        title: Text(isNewTask ? 'Add' : 'Edit'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TaskDetailsForm(),
            Spacer(),
            SubmittedButton(),
          ],
        ),
      ),
    );
  }
}
