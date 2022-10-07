import 'dart:convert';

import 'package:restaurant/models/order/order.dart';
import 'package:restaurant/models/order/order_write_request.dart';
import 'package:restaurant/schema/_schemas.dart';
import 'package:restaurant/service_locator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;

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

  Future<void> saveOrder({
    required String orderId,
    required OrderWriteRequest orderWriteRequest,
  }) {
    return _firebaseFirestore.collection(Collections.orders).doc(orderId).update(orderWriteRequest.toJson());
  }

  Future<void> updatePrize({
    required String orderId,
    required double prize,
  }) {
    return _firebaseFirestore.collection(Collections.orders).doc(orderId).update(
      {OrdersFields.prize: FieldValue.increment(prize)},
    );
  }

  Future sendEmail({
    required String email,
    required String message,
  }) async {
    String serviceId = 'service_braycyt';
    String templateId = 'template_lc9bowh';
    String uderId = 'vGOAh-e6qiMocp-iQ';

    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(
        {
          'service_id': serviceId,
          'template_id': templateId,
          'user_id': uderId,
          'template_params': {
            'message': message,
            'email': email,
          }
        },
      ),
    );
    return response.statusCode;
  }
}
