import 'package:restaurant/models/suborder/suborder.dart';
import 'package:restaurant/models/suborder/suborder_write_request.dart';
import 'package:restaurant/schema/_schemas.dart';
import 'package:restaurant/service_locator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SubordersDataProvider {
  final FirebaseFirestore _firebaseFirestore = sl();

  Future<Map<String, Suborder>> fetchAllSuborder() async {
    final QuerySnapshot<Map<String, dynamic>> result = await _firebaseFirestore.collection(Collections.orders).get();

    final Map<String, Suborder> orders = <String, Suborder>{};

    for (QueryDocumentSnapshot<Map<String, dynamic>> doc in result.docs) {
      final Suborder order = Suborder.fromJson(doc.data()..['id'] = doc.id);
      orders[doc.id] = order;
    }

    return orders;
  }

  Stream<List<Suborder>> getSubordersStream() {
    return _firebaseFirestore.collection(Collections.orders).snapshots().map(
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
    required SuborderWriteRequest orderWriteRequest,
  }) {
    return _firebaseFirestore.collection(Collections.orders).add(orderWriteRequest.toJson());
  }

  Future<void> delete({
    required String suborderId,
  }) {
    return _firebaseFirestore.collection(Collections.orders).doc(suborderId).delete();
  }
}
