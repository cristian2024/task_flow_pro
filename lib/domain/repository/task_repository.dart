import 'package:task_flow_pro/domain/model/task.dart';

abstract interface class TaskRepository {
  Future<List<Task>> getTasks();
  Future<void> createTask(Task task);

  Future<void> toggleTask(Task task, bool value);
}
