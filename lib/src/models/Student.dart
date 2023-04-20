import 'package:json_annotation/json_annotation.dart';

part 'Student.g.dart';

@JsonSerializable()
class Student {
  Student(
    this.group,
    this.surname,
    this.first_name,
    this.patronymic,
    this.is_headman
  );

  String group;
  String surname;
  String first_name;
  String patronymic;
  bool is_headman;

  factory Student.fromJson(Map<String, dynamic> json) => _$StudentFromJson(json);

  Map<String, dynamic> toJson() => _$StudentToJson(this);
}