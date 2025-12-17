import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'
    show BlocConsumer, ReadContext;
import 'package:task_flow_pro/ui/models/process_status.dart';
import 'package:task_flow_pro/ui/provider/tasks/tasks_cubit.dart';
import 'package:task_flow_pro/ui/widgets/task_item.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "TaskFlow PRO",
                style: Theme.of(context).textTheme.displaySmall,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              BlocConsumer<TasksCubit, TasksState>(
                listener: (context, state) {
                  if (state.status == ProcessStatus.error) {
                    showError(context);
                  }
                },
                builder: (context, state) {
                  final TasksState(:tasks, :status) = state;
                  if (tasks.isEmpty) {
                    if (status != ProcessStatus.loading) {
                      return Column(
                        children: [
                          Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                              Icon(
                                Icons.task_alt,
                                size: 48,
                                color: Theme.of(
                                  context,
                                ).primaryColor.withAlpha(100),
                              ),
                              Icon(
                                Icons.close,
                                size: 40,
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              status == ProcessStatus.error
                                  ? "No pudimos obtener la lista de tareas"
                                  : "No tienes tasks creadas",
                              style: Theme.of(context).textTheme.headlineSmall,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      );
                    }
                  }

                  return Expanded(
                    child: Column(
                      children: [
                        if (status == ProcessStatus.loading)
                          Center(child: CircularProgressIndicator()),
                        Expanded(
                          child: RefreshIndicator(
                            onRefresh: () async {
                              context.read<TasksCubit>().getTaskList();
                            },
                            child: ListView.builder(
                              itemCount: tasks.length,
                              itemBuilder: (context, index) {
                                final task = tasks[index];
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 8),
                                  child: TaskItem(
                                    task,
                                    onToggleValue: (_) {
                                      context
                                          .read<TasksCubit>()
                                          .toggleTaskCompletion(
                                            task,
                                          );
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: "Crear task",
        child: Icon(Icons.add),
      ),
    );
  }

  Future<void> showError(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Icon(
                    Icons.task_alt,
                    size: 48,
                    color: Theme.of(
                      context,
                    ).primaryColor.withAlpha(100),
                  ),
                  Icon(
                    Icons.close,
                    size: 40,
                  ),
                ],
              ),
              Text("Algo fallo con el proceso"),
            ],
          ),
        );
      },
    );
  }
}
