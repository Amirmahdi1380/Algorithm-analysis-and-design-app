import 'package:algorithm_app/data/datasource/lesson_datasource.dart';
import 'package:algorithm_app/data/repository/lesson_repository.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

var locator = GetIt.instance;

Future<void> getItInit() async {
  locator.registerSingleton<Dio>(
    Dio(
      BaseOptions(baseUrl: 'https://jbrfm.pythonanywhere.com', headers: {
        'Accept': 'application/json',
      }),
    ),
  );

  //datasource
  locator.registerFactory<ILessonDatasource>(() => LessonDatasource());

  //repository
  locator.registerFactory<ILessonRepository>(() => LessonRepository());
}
