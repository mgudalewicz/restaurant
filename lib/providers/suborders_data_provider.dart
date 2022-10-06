import 'package:restaurant/models/suborder/suborder.dart';
import 'package:restaurant/models/suborder/suborder_write_request.dart';
import 'package:restaurant/schema/_schemas.dart';
import 'package:restaurant/service_locator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SubordersDataProvider {
  final FirebaseFirestore _firebaseFirestore = sl();

  Future<Map<String, Suborder>> fetchAllSuborder() async {
    final QuerySnapshot<Map<String, dynamic>> result = await _firebaseFirestore.collection(Collections.suborders).get();

    final Map<String, Suborder> suborders = <String, Suborder>{};

    for (QueryDocumentSnapshot<Map<String, dynamic>> doc in result.docs) {
      final Suborder suborder = Suborder.fromJson(doc.data()..['id'] = doc.id);
      suborders[doc.id] = suborder;
    }

    return suborders;
  }

  Stream<List<Suborder>> getSubordersStream() {
    return _firebaseFirestore.collection(Collections.suborders).snapshots().map(
      (querySnapshot) {
        return querySnapshot.docs.map(
          (doc) {
            return Suborder.fromJson(doc.data()..['id'] = doc.id);
          },
        ).toList();
      },
    );
  }

  Future<void> create({
    required SuborderWriteRequest suborderWriteRequest,
  }) {
    return _firebaseFirestore.collection(Collections.suborders).add(suborderWriteRequest.toJson());
  }

  Future<void> delete({
    required String suborderId,
  }) {
    return _firebaseFirestore.collection(Collections.suborders).doc(suborderId).delete();
  }

  Future<void> updateAmount({
    required String suborderId,
    required int amount,
  }) {
    return _firebaseFirestore.collection(Collections.suborders).doc(suborderId).update(
      {SubordersFields.amount: amount},
    );
  }
}
