import 'package:flutter/material.dart';
import 'package:task_flow_pro/config/injection.dart';
import 'package:task_flow_pro/ui/screens/tasks_screen.dart';

void main() {
  inject();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TasksScreen(),
    );
  }
}
