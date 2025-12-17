import 'package:task_flow_pro/domain/model/task.dart';
import 'package:task_flow_pro/ui/models/task_status.dart';

extension TaskUtils on Task {
  TaskStatus getCurrentStatus() {
    final DateTime now = DateTime.now();
    if (isCompleted) {
      return TaskStatus.completed;
    }
    if (expectedDate?.isAfter(now) ?? false) {
      return TaskStatus.overdue;
    }
    return TaskStatus.inProcess;
  }
}
