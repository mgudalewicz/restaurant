import 'package:restaurant/models/order/order.dart';
import 'package:restaurant/models/order/order_write_request.dart';
import 'package:restaurant/schema/_schemas.dart';
import 'package:restaurant/service_locator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OrdersDataProvider {
  final FirebaseFirestore _firebaseFirestore = sl();

  Future<Map<String, Order>> fetchAllOrder() async {
    final QuerySnapshot<Map<String, dynamic>> result = await _firebaseFirestore.collection(Collections.orders).get();

    final Map<String, Order> orders = <String, Order>{};

    for (QueryDocumentSnapshot<Map<String, dynamic>> doc in result.docs) {
      final Order order = Order.fromJson(doc.data()..['id'] = doc.id);
      orders[doc.id] = order;
    }

    return orders;
  }

  Stream<List<Order>> getOrdersStream() {
    return _firebaseFirestore.collection(Collections.orders).snapshots().map(
      (querySnapshot) {
        return querySnapshot.docs.map(
          (doc) {
            return Order.fromJson(doc.data()..['id'] = doc.id);
          },
        ).toList();
      },
    );
  }

  Future<void> create({
    required OrderWriteRequest orderWriteRequest,
  }) {
    return _firebaseFirestore.collection(Collections.orders).add(orderWriteRequest.toJson());
  }
}