import 'package:flutter/material.dart';
import 'package:task_flow_pro/ui/models/task_status.dart';
import 'package:task_flow_pro/ui/utils/date_utils.dart';
import 'package:task_flow_pro/ui/utils/task_utils.dart';
import '../../domain/model/task.dart';

class TaskItem extends StatelessWidget {
  const TaskItem(
    this.task, {
    required this.onToggleValue,
    super.key,
  });

  final Task task;
  final void Function(bool value) onToggleValue;

  @override
  Widget build(BuildContext context) {
    final Task(:title, :notes, :expectedDate) = task;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    statusText,
                    style: TextStyle(
                      color: getStatusColor(context),
                      decoration: TextDecoration.underline,
                    ),
                  ),

                  //TODO(Cristian): añadir label de estado(en proceso, completada, atrazada)
                  if (notes != null) Text(notes),
                  if (expectedDate != null)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.access_time),
                        SizedBox(width: 4),
                        Text(expectedDate.fullFormatDate()),
                      ],
                    ),
                ],
              ),
            ),
            SizedBox(width: 8),
            SizedBox(
              width: 24,
              height: 24,
              child: Checkbox(
                value: task.isCompleted,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                onChanged: (value) => onToggleValue(value ?? !task.isCompleted),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String get statusText {
    return switch (task.getCurrentStatus()) {
      TaskStatus.overdue => "Tarea atrazada",
      TaskStatus.completed => "Tarea completada",
      _ => "Tarea en proceso",
    };
  }

  Color getStatusColor(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return switch (task.getCurrentStatus()) {
      TaskStatus.overdue => colorScheme.error,
      TaskStatus.completed => colorScheme.primary,
      _ => colorScheme.secondary,
    };
  }
}
