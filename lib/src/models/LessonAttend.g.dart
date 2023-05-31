// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LessonAttend.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LessonAttend _$LessonAttendFromJson(Map<String, dynamic> json) => LessonAttend(
      json['date'] as String,
      (json['lessons'] as List<dynamic>)
          .map((e) => Lesson.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LessonAttendToJson(LessonAttend instance) =>
    <String, dynamic>{
      'date': instance.date,
      'lessons': instance.lessons,
    };
