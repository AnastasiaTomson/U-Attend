// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Lesson.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Lesson _$LessonFromJson(Map<String, dynamic> json) => Lesson(
      json['id'] as int?,
      json['week'] as String,
      json['time'] as String,
      json['subject'] as String,
      json['type'] as String,
      json['place'] as String,
      json['building'] as String,
      json['room'] as String,
      json['sync'] as String,
      json['date'] as String?,
      (json['groups'] as List<dynamic>).map((e) => e as String).toList(),
      json['weekday'] as String,
      json['is_attend'] as bool?,
      json['teacher'] as String?,
      json['count_student_attend'] as int?,
    );

Map<String, dynamic> _$LessonToJson(Lesson instance) => <String, dynamic>{
      'id': instance.id,
      'week': instance.week,
      'time': instance.time,
      'subject': instance.subject,
      'type': instance.type,
      'place': instance.place,
      'building': instance.building,
      'room': instance.room,
      'sync': instance.sync,
      'date': instance.date,
      'groups': instance.groups,
      'weekday': instance.weekday,
      'teacher': instance.teacher,
      'is_attend': instance.is_attend,
      'count_student_attend': instance.count_student_attend,
    };
