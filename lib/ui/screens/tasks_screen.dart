import 'package:flutter/material.dart';
import 'package:task_flow_pro/data/data_source/task_fake_data.dart';
import 'package:task_flow_pro/domain/model/task.dart';
import 'package:task_flow_pro/ui/widgets/task_item.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final task = TaskFakeData().getListOfTasks(1)[0];
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(16),
          child: Column(
            children: [
              TaskItem(
                task,
                onToggleValue: (value) {},
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: "Crear task",
        child: Icon(Icons.add),
      ),
    );
  }
}
