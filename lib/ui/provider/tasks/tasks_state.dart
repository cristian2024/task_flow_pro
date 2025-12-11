part of 'tasks_cubit.dart';

class TasksState extends Equatable {
  const TasksState({
    this.status = ProcessStatus.notInititated,
    this.tasks = const [],
  });

  final ProcessStatus status;
  final List<Task> tasks;

  @override
  List<Object?> get props => [status, tasks];
  
  TasksState copyWith({
    ProcessStatus? status,
    List<Task>? tasks,
  }) {
    ProcessStatus newStatus = status ?? this.status;
    if (this.status == ProcessStatus.error) {
      newStatus = status ?? ProcessStatus.notInititated;
    }

    return TasksState(
      status: newStatus,
      tasks: tasks ?? this.tasks,
    );
  }
}
