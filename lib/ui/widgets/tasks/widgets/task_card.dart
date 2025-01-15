import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:space_scutum_todo/ui/widgets/tasks/tasks.dart';
import 'package:todos_repository/todos_repository.dart';

class TaskCard extends StatelessWidget {
  final Todo task;

  const TaskCard({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key('TaskCard_${task.id}'),
      child: ListTile(
        title: Text(
          task.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: task.isCompleted
              ? TextStyle(decoration: TextDecoration.lineThrough)
              : null,
        ),
        subtitle: Text(
          task.description,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: task.isCompleted
              ? TextStyle(decoration: TextDecoration.lineThrough)
              : null,
        ),
        leading: Checkbox(
          value: task.isCompleted,
          onChanged: (value) => context.read<TasksBloc>().add(
            TasksCompletionToggled(task: task, isCompleted: value ?? false),
          ),
        ),
        trailing: Icon(Icons.chevron_right),
        // TODO: task edit screen
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => Scaffold(body: SizedBox())),
        ),
      ),
    );
  }
}