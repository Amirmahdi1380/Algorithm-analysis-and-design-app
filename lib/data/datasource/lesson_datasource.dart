import 'package:algorithm_app/di/di.dart';
import 'package:algorithm_app/model/lesson/lesson_list.dart';
import 'package:dio/dio.dart';

abstract class ILessonDatasource {
  Future<LessonList> getLessons();
}

class LessonDatasource extends ILessonDatasource {

 final Dio _dio = locator.get();
 @override
  Future<LessonList> getLessons() async{
   try {
      Response response = await _dio.get('/lessons/',
          options: Options(headers: {
            'Accept': 'application/json',
          }));
      return LessonList.fromJson(response.data);
    } catch (e) {
      throw Exception(e);
    }
  }
}
