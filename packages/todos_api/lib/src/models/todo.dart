import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'todo.g.dart';

@JsonSerializable()
class Todo extends Equatable {
  final String id;
  final String title;
  final String description;
  final String category;
  final bool isCompleted;

  Todo({
    String? id,
    required this.title,
    this.description = '',
    this.category = '',
    this.isCompleted = false,
  }) : id = id ?? const Uuid().v4();

  static Todo fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);

  Map<String, dynamic> toJson() => _$TodoToJson(this);

  @override
  List<Object> get props => [id, title, description, category, isCompleted,];

  Todo copyWith({
    String? id,
    String? title,
    String? description,
    String? category,
    bool? isCompleted,
  }) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
