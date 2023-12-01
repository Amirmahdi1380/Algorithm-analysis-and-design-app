import 'package:algorithm_app/data/repository/lesson_repository.dart';
import 'package:bloc/bloc.dart';

import '../../di/di.dart';
import 'lessons_event.dart';
import 'lessons_state.dart';

class LessonsBloc extends Bloc<LessonsEvent, LessonsState> {
  final ILessonRepository _iLessonRepository = locator.get();
  LessonsBloc() : super(LessonsInitState()) {
    on((event, emit) async {
      if (event is LessonsStartEvent) {
        emit(LessonsLoadingState());
        var getLessons = await _iLessonRepository.getLessons();
        emit(LessonsResponseState(getLessons));
      }
    });
  }
}