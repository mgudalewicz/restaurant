import 'package:restaurant/models/main_course/main_course.dart';
import 'package:restaurant/service_locator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MainCoursesDataProvider {
  final FirebaseFirestore _firebaseFirestore = sl();

  Future<Map<String, MainCourse>> fetchAllMainCourse() async {
    final QuerySnapshot<Map<String, dynamic>> result = await _firebaseFirestore.collection('mainCourse').get();

    final Map<String, MainCourse> mainCourses = <String, MainCourse>{};

    for (QueryDocumentSnapshot<Map<String, dynamic>> doc in result.docs) {
      final MainCourse mainCourse = MainCourse.fromJson(doc.data()..['id'] = doc.id);
      mainCourses[doc.id] = mainCourse;
    }

    return mainCourses;
  }

  Stream<List<MainCourse>> getMainCoursesStream() {
    return _firebaseFirestore.collection('mainCourse').snapshots().map(
      (querySnapshot) {
        return querySnapshot.docs.map(
          (doc) {
            return MainCourse.fromJson(doc.data()..['id'] = doc.id);
          },
        ).toList();
      },
    );
  }
}
