import 'package:equatable/equatable.dart';

class Task extends Equatable {
  final String? description;
  final String id;
  final String title;
  final bool isCompleted;

  const Task({
    required this.description,
    required this.id,
    required this.title,
    required this.isCompleted,
  });

  @override
  List<Object?> get props => [
    description,
    id,
    title,
    isCompleted,
  ];
}
