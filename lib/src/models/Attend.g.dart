// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Attend.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Attend _$AttendFromJson(Map<String, dynamic> json) => Attend(
      json['id'] as int?,
      json['is_attend'] as bool,
      json['surname'] as String,
      json['first_name'] as String,
      json['patronymic'] as String,
      json['is_headman'] as bool,
      json['group'] as String,
    );

Map<String, dynamic> _$AttendToJson(Attend instance) => <String, dynamic>{
      'id': instance.id,
      'is_attend': instance.is_attend,
      'surname': instance.surname,
      'first_name': instance.first_name,
      'patronymic': instance.patronymic,
      'is_headman': instance.is_headman,
      'group': instance.group,
    };
