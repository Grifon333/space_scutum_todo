import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:space_scutum_todo/ui/widgets/tasks/tasks.dart';

class TasksFilterButton extends StatelessWidget {
  const TasksFilterButton({super.key});

  @override
  Widget build(BuildContext context) {
    final filter = context.select((TasksBloc bloc) => bloc.state.filter);
    return PopupMenuButton<TasksFilter>(
      itemBuilder: (context) => [
        PopupMenuItem(value: TasksFilter.all, child: Text('all')),
        PopupMenuItem(value: TasksFilter.complete, child: Text('complete')),
        PopupMenuItem(value: TasksFilter.active, child: Text('activate')),
      ],
      initialValue: filter,
      onSelected: (value) {
        context.read<TasksBloc>().add(TasksFilterChanged(value));
      },
      icon: const Icon(Icons.filter_alt_rounded),
    );
  }
}