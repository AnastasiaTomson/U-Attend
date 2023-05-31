import 'package:json_annotation/json_annotation.dart';

part 'Attend.g.dart';

@JsonSerializable()
class Attend {
  Attend(
      this.id,
      this.is_attend,
      this.surname,
      this.first_name,
      this.patronymic,
      this.is_headman,
      this.group
      );

  int? id;
  bool is_attend;
  String surname;
  String first_name;
  String patronymic;
  bool is_headman;
  String group;

  factory Attend.fromJson(Map<String, dynamic> json) => _$AttendFromJson(json);

  Map<String, dynamic> toJson() => _$AttendToJson(this);
}
