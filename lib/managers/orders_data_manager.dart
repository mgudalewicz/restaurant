import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:restaurant/models/order/order.dart';
import 'package:restaurant/models/order/order_write_request.dart';
import 'package:restaurant/providers/_provider.dart';
import 'package:restaurant/service_locator.dart';

class OrdersDataManager {
  final OrdersDataProvider _ordersDataProvider = sl();

  Future<void> fetch() async {
    _ordersDataProvider.fetchAllOrder();
  }

  Stream<List<Order>> getAllItems() {
    return _ordersDataProvider.getOrdersStream();
  }

  Future<void> create(
    OrderWriteRequest orderWriteRequest,
  ) async {
    try {
      await _ordersDataProvider.create(
        orderWriteRequest: orderWriteRequest,
      );
      await fetch();
    } catch (e) {
      Fluttertoast.showToast(
        msg: 'Coś poszło nie tak',
        gravity: ToastGravity.TOP,
        backgroundColor: Colors.red,
      );
    }
  }

  Future<void> updatePrize({
    required String orderId,
    required double prize,
  }) async {
    try {
      await _ordersDataProvider.updatePrize(
        orderId: orderId,
        prize: prize,
      );
      await fetch();
    } catch (e) {
      Fluttertoast.showToast(
        msg: e.toString(),
        gravity: ToastGravity.TOP,
        backgroundColor: Colors.red,
      );
    }
  }
}
