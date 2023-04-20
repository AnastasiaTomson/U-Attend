import 'package:json_annotation/json_annotation.dart';

part 'Teacher.g.dart';

@JsonSerializable()
class Teacher {
  Teacher(
    this.surname,
    this.first_name,
    this.patronymic
  );

  String surname;
  String first_name;
  String patronymic;

  factory Teacher.fromJson(Map<String, dynamic> json) => _$TeacherFromJson(json);

  Map<String, dynamic> toJson() => _$TeacherToJson(this);
}