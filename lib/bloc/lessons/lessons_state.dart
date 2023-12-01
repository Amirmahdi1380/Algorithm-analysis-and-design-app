import 'package:algorithm_app/model/lesson/lesson_list.dart';
import 'package:dartz/dartz.dart';

abstract class LessonsState {}

class LessonsInitState extends LessonsState {}

class LessonsLoadingState extends LessonsState {}

class LessonsResponseState extends LessonsState {
  Either<String , LessonList> getlessons;
  LessonsResponseState(this.getlessons);
}