// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Teacher.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Teacher _$TeacherFromJson(Map<String, dynamic> json) => Teacher(
      json['surname'] as String,
      json['first_name'] as String,
      json['patronymic'] as String,
    );

Map<String, dynamic> _$TeacherToJson(Teacher instance) => <String, dynamic>{
      'surname': instance.surname,
      'first_name': instance.first_name,
      'patronymic': instance.patronymic,
    };
