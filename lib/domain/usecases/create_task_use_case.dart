import 'package:task_flow_pro/domain/model/task.dart';
import 'package:task_flow_pro/domain/repository/task_repository.dart';

class CreateTaskUseCase {
  final TaskRepository _repository;

  CreateTaskUseCase(this._repository);
  Future<void> createTask(Task task) {
    return _repository.createTask(task);
  }
}
