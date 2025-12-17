import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_flow_pro/config/injection.dart';
import 'package:task_flow_pro/ui/provider/tasks/tasks_cubit.dart';
import 'package:task_flow_pro/ui/widgets/tasks_page.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TasksCubit(
        listTasksUseCase: readIt(),
        editTaskUseCase: readIt(),
      )..getTaskList(),
      child: TasksPage(),
    );
  }
}
