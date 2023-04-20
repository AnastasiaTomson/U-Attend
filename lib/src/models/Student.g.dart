// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Student.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Student _$StudentFromJson(Map<String, dynamic> json) => Student(
      json['group'] as String,
      json['surname'] as String,
      json['first_name'] as String,
      json['patronymic'] as String,
      json['is_headman'] as bool,
    );

Map<String, dynamic> _$StudentToJson(Student instance) => <String, dynamic>{
      'group': instance.group,
      'surname': instance.surname,
      'first_name': instance.first_name,
      'patronymic': instance.patronymic,
      'is_headman': instance.is_headman,
    };
