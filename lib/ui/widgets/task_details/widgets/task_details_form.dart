import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:space_scutum_todo/ui/widgets/task_details/task_details.dart';

class TaskDetailsForm extends StatelessWidget {
  const TaskDetailsForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      children: [
        TitleTextField(),
        DescriptionTextField(),
        CategoryTextField(),
      ],
    );
  }
}

class TitleTextField extends StatelessWidget {
  const TitleTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<TaskDetailsBloc>();
    final title = bloc.state.title;

    return TextFormField(
      initialValue: title,
      decoration: InputDecoration(
        hintText: 'Add the title...',
        enabled: !bloc.state.status.isLoadingOrSuccess,
      ),
      style: TextStyle(fontSize: 18, color: Colors.white),
      inputFormatters: [
        LengthLimitingTextInputFormatter(50),
        FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9\s]')),
      ],
      onChanged: (value) => bloc.add(TaskDetailsTitleChanged(value)),
    );
  }
}

class DescriptionTextField extends StatelessWidget {
  const DescriptionTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<TaskDetailsBloc>();
    final description = bloc.state.description;

    return TextFormField(
      initialValue: description,
      decoration: InputDecoration(
        hintText: 'Add the description...',
        enabled: !bloc.state.status.isLoadingOrSuccess,
      ),
      style: TextStyle(fontSize: 18, color: Colors.white),
      maxLines: 5,
      inputFormatters: [LengthLimitingTextInputFormatter(200)],
      onChanged: (value) => bloc.add(TaskDetailsDescriptionChanged(value)),
    );
  }
}

class CategoryTextField extends StatelessWidget {
  const CategoryTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<TaskDetailsBloc>();
    final category = bloc.state.category;

    return TextFormField(
      initialValue: category,
      decoration: InputDecoration(
        hintText: 'Add the category...',
        enabled: !bloc.state.status.isLoadingOrSuccess,
      ),
      style: TextStyle(fontSize: 18, color: Colors.white),
      inputFormatters: [
        LengthLimitingTextInputFormatter(50),
        FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]')),
      ],
      onChanged: (value) => bloc.add(TaskDetailsCategoryChanged(value)),
    );
  }
}
