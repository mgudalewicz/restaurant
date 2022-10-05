import 'package:restaurant/models/main_course/main_course.dart';
import 'package:restaurant/providers/_provider.dart';
import 'package:restaurant/service_locator.dart';

class MainCoursesDataManager {
  final MainCoursesDataProvider _mainCoursesDataProvider = sl();

  Future<void> fetch() async {
    _mainCoursesDataProvider.fetchAllMainCourse();
  }

  Stream<List<MainCourse>> getAllMainCourses() {
    return _mainCoursesDataProvider.getMainCoursesStream();
  }
}
