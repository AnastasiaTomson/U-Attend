import 'package:json_annotation/json_annotation.dart';
import 'package:u_attend/src/models/Lesson.dart';

part 'LessonAttend.g.dart';

@JsonSerializable()
class LessonAttend {
  LessonAttend(
      this.date,
      this.lessons
      );

  String date;
  List<Lesson> lessons;

  factory LessonAttend.fromJson(Map<String, dynamic> json) => _$LessonAttendFromJson(json);

  Map<String, dynamic> toJson() => _$LessonAttendToJson(this);
}
