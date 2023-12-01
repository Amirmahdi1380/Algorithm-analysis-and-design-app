import 'lesson.dart';

class LessonList {
  final List<Lesson> lessons;

  LessonList({required this.lessons});

  factory LessonList.fromJson(List<dynamic> json) {
    List<Lesson> lessonList = json.map((lessonJson) => Lesson.fromJson(lessonJson)).toList();
    return LessonList(lessons: lessonList);
  }
}