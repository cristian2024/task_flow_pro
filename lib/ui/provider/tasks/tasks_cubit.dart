import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_flow_pro/domain/model/task.dart';
import 'package:task_flow_pro/domain/usecases/edit_task_use_case.dart';
import 'package:task_flow_pro/domain/usecases/list_tasks_use_case.dart';
import 'package:task_flow_pro/ui/models/process_status.dart';

part 'tasks_state.dart';

class TasksCubit extends Cubit<TasksState> {
  final ListTasksUseCase _listTasksUseCase;
  final EditTaskUseCase _editTaskUseCase;

  TasksCubit({
    required ListTasksUseCase listTasksUseCase,
    required EditTaskUseCase editTaskUseCase,
  }) : _listTasksUseCase = listTasksUseCase,
       _editTaskUseCase = editTaskUseCase,
       super(TasksState());

  Future<void> getTaskList() async {
    emit(state.copyWith(status: ProcessStatus.loading));

    await Future.delayed(Duration(seconds: 3));

    try {
      final tasks = await _listTasksUseCase.getTasks();

      emit(
        state.copyWith(
          status: ProcessStatus.completed,
          tasks: tasks,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: ProcessStatus.error));
    }
  }

  Future<void> toggleTaskCompletion(Task task) async {
    final originalList = state.tasks;
    final newList = state.tasks.map(
      (taskk) {
        if (taskk == task) {
          return task.copyWith(
            isCompleted: !task.isCompleted,
          );
        }
        return taskk;
      },
    ).toList();

    emit(
      state.copyWith(
        status: ProcessStatus.loading,
        tasks: newList,
      ),
    );

    try {
      await _editTaskUseCase.modifyChecked(task);
      emit(state.copyWith(status: ProcessStatus.completed));
    } catch (e) {
      emit(state.copyWith(status: ProcessStatus.error, tasks: originalList));
    }
  }
}
