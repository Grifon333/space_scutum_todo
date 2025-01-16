import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_scutum_todo/ui/widgets/home/home.dart';
import 'package:space_scutum_todo/ui/widgets/task_details/task_details.dart';
import 'package:space_scutum_todo/ui/widgets/tasks/tasks.dart';
import 'package:space_scutum_todo/ui/widgets/weather/view/weather_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(),
      child: HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedTab = context.select((HomeCubit cubit) => cubit.state.tab);
    return Scaffold(
      body: IndexedStack(
        index: selectedTab.index,
        children: const [TasksPage(), WeatherPage()],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(TaskDetailsPage.route()),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TabButton(
              icon: const Icon(Icons.list),
              value: HomeTab.todos,
              selectValue: selectedTab,
            ),
            TabButton(
              icon: const Icon(Icons.sunny),
              value: HomeTab.weather,
              selectValue: selectedTab,
            ),
          ],
        ),
      ),
    );
  }
}

class TabButton extends StatelessWidget {
  final Icon icon;
  final HomeTab value;
  final HomeTab selectValue;

  const TabButton({
    super.key,
    required this.icon,
    required this.value,
    required this.selectValue,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => context.read<HomeCubit>().setTap(value),
      icon: icon,
      iconSize: 32,
      color: value == selectValue ? Colors.green : null,
    );
  }
}
