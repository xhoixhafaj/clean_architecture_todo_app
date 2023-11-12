
import 'package:equatable/equatable.dart';

class Todo extends Equatable {

  final int? id;
  final String title;
  final String description;
  final bool isDone;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime untilDate;

  const Todo({
    this.id,
    required this.title,
    required this.description,
    required this.isDone,
    required this.createdAt,
    required this.updatedAt,
    required this.untilDate,
  });

  Todo copyWith({
    int? id,
    String? title,
    String? description,
    bool? isDone,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? untilDate,
  }) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isDone: isDone ?? this.isDone,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      untilDate: untilDate ?? this.untilDate,
    );
  }

  @override
  List<Object?> get props => [
    id,
    title,
    description,
    isDone,
    createdAt,
    updatedAt,
    untilDate,
  ];

}