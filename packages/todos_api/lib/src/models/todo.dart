import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'todo.g.dart';

/// A data model representing a single `todo` item.
/// Contains a [title], [description] and [id], in addition to a [isCompleted] flag.
///
/// If [id] is specified, it cannot be empty. If [id] is not specified, it will be generated.
@JsonSerializable()
class Todo extends Equatable {
  /// The id of the `todo`
  ///
  /// Cannot be empty
  final String id;

  /// The title of the `todo`
  ///
  /// Cannot be empty
  final String title;

  /// The description of the `todo`
  ///
  /// Default to an empty string
  final String description;

  /// The category of the `todo`
  ///
  /// Default to an empty string
  final String category;

  /// Whether the `todo` is completed
  ///
  /// Default to 'false'
  final bool isCompleted;

  Todo({
    String? id,
    required this.title,
    this.description = '',
    this.category = '',
    this.isCompleted = false,
  })  : assert(id == null || id.isNotEmpty, 'id must either be null or not empty'),
        id = id ?? const Uuid().v4();

  static Todo fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);

  Map<String, dynamic> toJson() => _$TodoToJson(this);

  @override
  List<Object> get props => [
        id,
        title,
        description,
        category,
        isCompleted,
      ];

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
