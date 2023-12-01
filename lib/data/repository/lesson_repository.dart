import 'package:algorithm_app/data/datasource/lesson_datasource.dart';
import 'package:algorithm_app/di/di.dart';
import 'package:algorithm_app/model/lesson/lesson_list.dart';
import 'package:dartz/dartz.dart';

abstract class ILessonRepository {
  Future<Either<String, LessonList>> getLessons();
}

class LessonRepository extends ILessonRepository {
  final ILessonDatasource _lessonsDatasource = locator.get();

  @override
  Future<Either<String, LessonList>> getLessons() async {
    try {
      var response = await _lessonsDatasource.getLessons();
      return right(response);
    } catch (e) {
      return left(e.toString());
    }
  }
}
