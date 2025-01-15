import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_scutum_todo/ui/widgets/tasks/tasks.dart';
import 'package:space_scutum_todo/ui/widgets/tasks/widgets/widgets.dart';
import 'package:todos_repository/todos_repository.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TasksBloc(
        repository: context.read<TodosRepository>(),
      )..add(const TasksSubscriptionRequired()),
      child: const TasksView(),
    );
  }
}

class TasksView extends StatelessWidget {
  const TasksView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Tasks'),
        actions: [TasksFilterButton()],
      ),
      body: BlocListener<TasksBloc, TasksState>(
        listener: (context, state) {
          if (state.status == TasksStatus.failure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text('An error occurred while loading tasks'),
                ),
              );
          }
        },
        listenWhen: (previous, current) => previous.status != current.status,
        child: BlocBuilder<TasksBloc, TasksState>(
          builder: (context, state) {
            if (state.tasks.isEmpty) {
              if (state.status == TasksStatus.loading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.storage,
                      color: Colors.grey,
                      size: 84,
                    ),
                    Text(
                      'The tasks list is empty',
                      style: TextStyle(color: Colors.grey, fontSize: 24),
                    ),
                  ],
                ),
              );
            }
            return Padding(
              padding: const EdgeInsets.all(8),
              child: ListView.separated(
                itemBuilder: (context, index) {
                  final task = state.filteredTasks.elementAt(index);
                  return TaskCard(task: task);
                },
                separatorBuilder: (_, __) => SizedBox(height: 8),
                itemCount: state.filteredTasks.length
              ),
            );
          },
        ),
      ),
    );
  }
}
