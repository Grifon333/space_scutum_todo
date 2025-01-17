import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:space_scutum_todo/ui/widgets/task_details/task_details.dart';

class SubmittedButton extends StatelessWidget {
  const SubmittedButton({super.key});

  @override
  Widget build(BuildContext context) {
    final isLoadingOrSuccess = context
        .select((TaskDetailsBloc bloc) => bloc.state.status.isLoadingOrSuccess);
    return ElevatedButton(
      onPressed: isLoadingOrSuccess
          ? null
          : () => context.read<TaskDetailsBloc>().add(TaskDetailsSubmitted()),
      child: isLoadingOrSuccess
          ? CircularProgressIndicator()
          : Text(
              'Submitted',
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
    );
  }
}
