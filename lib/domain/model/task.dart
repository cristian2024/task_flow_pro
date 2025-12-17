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
  Task copyWith({
    String? notes,
    String? id,
    String? title,
    bool? isCompleted,
    DateTime? expectedDate,
    DateTime? finishDate,
  }) {
    return Task(
      notes: notes ?? this.notes,
      id: id ?? this.id,
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
      expectedDate: expectedDate ?? this.expectedDate,
      finishDate: finishDate ?? this.finishDate,
    );
  }
}
