import 'package:restaurant/models/extras/extra.dart';
import 'package:restaurant/schema/_schemas.dart';
import 'package:restaurant/service_locator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ExtrasDataProvider {
  final FirebaseFirestore _firebaseFirestore = sl();

  Future<Map<String, Extra>> fetchAllExtra() async {
    final QuerySnapshot<Map<String, dynamic>> result = await _firebaseFirestore.collection(Collections.extras).get();

    final Map<String, Extra> extras = <String, Extra>{};

    for (QueryDocumentSnapshot<Map<String, dynamic>> doc in result.docs) {
      final Extra extra = Extra.fromJson(doc.data()..['id'] = doc.id);
      extras[doc.id] = extra;
    }

    return extras;
  }

  Stream<List<Extra>> getExtrasStream() {
    return _firebaseFirestore.collection(Collections.extras).snapshots().map(
      (querySnapshot) {
        return querySnapshot.docs.map(
          (doc) {
            return Extra.fromJson(doc.data()..['id'] = doc.id);
          },
        ).toList();
      },
    );
  }
}
