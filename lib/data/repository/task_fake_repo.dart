import 'package:task_flow_pro/data/data_source/task_fake_data.dart';
import 'package:task_flow_pro/domain/model/task.dart';
import 'package:task_flow_pro/domain/repository/task_repository.dart';

class TaskFakeRepo implements TaskRepository {
  final TaskFakeData _taskData = TaskFakeData();

  @override
  Future<List<Task>> getTasks() async {
    return _taskData.getListOfTasks();
  }
  
  @override
  Future<void> createTask(Task task) {
    // TODO: implement createTask
    throw UnimplementedError();
  }
  
  @override
  Future<void> toggleTask(Task task, bool value) {
    // TODO: implement toggleTask
    throw UnimplementedError();
  }
}
