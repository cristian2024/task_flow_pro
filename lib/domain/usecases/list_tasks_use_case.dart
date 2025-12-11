import 'package:task_flow_pro/domain/model/task.dart';
import 'package:task_flow_pro/domain/repository/task_repository.dart';

class ListTasksUseCase {
  final TaskRepository _repository;

  ListTasksUseCase(this._repository);

  Future<List<Task>> getTasks() async {
    return _repository.getTasks();
  }
}
