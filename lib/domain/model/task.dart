import 'package:equatable/equatable.dart';

class Task extends Equatable {
  final String? notes;
  final String id;
  final String title;
  final bool isCompleted;
  final DateTime? expectedDate;
  final DateTime? finishDate;

  const Task({
    required this.notes,
    required this.id,
    required this.title,
    required this.isCompleted,
    this.expectedDate,
    this.finishDate,
  });

  @override
  List<Object?> get props => [
    notes,
    id,
    title,
    isCompleted,
    expectedDate,
    finishDate,
  ];
}
