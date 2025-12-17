import 'package:get_it/get_it.dart';
import 'package:task_flow_pro/data/repository/task_fake_repo.dart';
import 'package:task_flow_pro/domain/repository/task_repository.dart';
import 'package:task_flow_pro/domain/usecases/edit_task_use_case.dart';
import 'package:task_flow_pro/domain/usecases/list_tasks_use_case.dart';

GetIt _instance = GetIt.instance;
void inject() {
  final TaskRepository taskRepository = TaskFakeRepo();
  //injecting repositories
  _instance.registerSingleton<TaskRepository>(taskRepository);

  //injecting usecases
  _instance.registerFactory<ListTasksUseCase>(
    () => ListTasksUseCase(taskRepository),
  );
  _instance.registerFactory<EditTaskUseCase>(
    () => EditTaskUseCase(taskRepository),
  );
}

T readIt<T extends Object>() {
  return _instance.get();
}
