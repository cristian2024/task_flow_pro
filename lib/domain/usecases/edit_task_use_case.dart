import 'package:task_flow_pro/domain/model/task.dart';
import 'package:task_flow_pro/domain/repository/task_repository.dart';

class EditTaskUseCase {
  final TaskRepository _repository;

  EditTaskUseCase(this._repository);

  Future<void> modifyChecked(Task task) async {
    return _repository.toggleTask(task, !task.isCompleted);
  }
}
