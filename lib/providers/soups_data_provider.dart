import 'package:restaurant/models/soups/soup.dart';
import 'package:restaurant/schema/_schemas.dart';
import 'package:restaurant/service_locator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SoupsDataProvider {
  final FirebaseFirestore _firebaseFirestore = sl();

  Future<Map<String, Soup>> fetchAllSoup() async {
    final QuerySnapshot<Map<String, dynamic>> result = await _firebaseFirestore.collection(Collections.soups).get();

    final Map<String, Soup> soups = <String, Soup>{};

    for (QueryDocumentSnapshot<Map<String, dynamic>> doc in result.docs) {
      final Soup soup = Soup.fromJson(doc.data()..['id'] = doc.id);
      soups[doc.id] = soup;
    }

    return soups;
  }

  Stream<List<Soup>> getSoupsStream() {
    return _firebaseFirestore.collection(Collections.soups).snapshots().map(
      (querySnapshot) {
        return querySnapshot.docs.map(
          (doc) {
            return Soup.fromJson(doc.data()..['id'] = doc.id);
          },
        ).toList();
      },
    );
  }
}
