import 'package:json_annotation/json_annotation.dart';

part 'Lesson.g.dart';

@JsonSerializable()
class Lesson {
  Lesson(
    this.id,
    this.week,
    this.time,
    this.subject,
    this.type,
    this.place,
    this.building,
    this.room,
    this.sync,
    this.date,
    this.groups,
    this.weekday,
    this.is_attend,
    this.teacher,
    this.count_student_attend,
  );

  int? id;
  String week;
  String time;
  String subject;
  String type;
  String place;
  String building;
  String room;
  String sync;
  String? date;
  List<String> groups;
  String weekday;
  String? teacher;
  bool? is_attend;
  int? count_student_attend;

  factory Lesson.fromJson(Map<String, dynamic> json) => _$LessonFromJson(json);

  Map<String, dynamic> toJson() => _$LessonToJson(this);
}
