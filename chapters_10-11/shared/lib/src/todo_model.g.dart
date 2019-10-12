// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Todo _$TodoFromJson(Map<String, dynamic> json) {
  return Todo(json['userId'] as int, json['id'] as int, json['title'] as String,
      json['completed'] as bool);
}

Map<String, dynamic> _$TodoToJson(Todo instance) => <String, dynamic>{
      'userId': instance.userId,
      'id': instance.id,
      'title': instance.title,
      'completed': instance.completed
    };

AllTodos _$AllTodosFromJson(Map<String, dynamic> json) {
  return AllTodos((json['todos'] as List)
      ?.map((e) => e == null ? null : Todo.fromJson(e as Map<String, dynamic>))
      ?.toList());
}

Map<String, dynamic> _$AllTodosToJson(AllTodos instance) =>
    <String, dynamic>{'todos': instance.todos};
