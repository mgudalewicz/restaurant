import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:restaurant/managers/_managers.dart';
import 'package:restaurant/models/extras/extra.dart';
import 'package:restaurant/models/item/item.dart';
import 'package:restaurant/models/order/order.dart';
import 'package:restaurant/models/order/order_write_request.dart';
import 'package:restaurant/models/suborder/suborder.dart';
import 'package:restaurant/service_locator.dart';
import 'package:rxdart/rxdart.dart';

part 'order_details_state.dart';

class OrderDetailsCubit extends Cubit<OrderDetailsState> {
  OrderDetailsCubit() : super(const OrderDetailsLoadingState());

  final SubordersDataManager _subordersDataManager = sl();
  final OrdersDataManager _ordersDataManager = sl();
  final ItemsDataManager _itemsDataManager = sl();
  final ExtrasDataManager _extrasDataManager = sl();
  final FirebaseAuth _firebaseAuth = sl();

  StreamSubscription<dynamic>? _subscription;

  Future<void> init(String orderId) async {
    await _subordersDataManager.fetch();
    await _ordersDataManager.fetch();
    await _itemsDataManager.fetch();
    await _extrasDataManager.fetch();

    _subscription = CombineLatestStream.combine4(
      _subordersDataManager.getAllItems(),
      _ordersDataManager.getAllItems(),
      _itemsDataManager.getAllItems(),
      _extrasDataManager.getAllExtras(),
      (
        List<Suborder> suborder,
        List<Order> orders,
        List<Item> items,
        List<Extra> extras,
      ) {
        final Order order = orders.firstWhere((Order order) => order.id == orderId);
        final List<Suborder> suborders = suborder.where((Suborder suborder) => suborder.orderId == orderId).toList();

        emit(OrderDetailsLoadedState(
          suborder: suborders,
          order: order,
          items: items,
          extras: extras,
        ));
      },
    ).listen((_) {});
  }

  Future<bool> deleteSuborder({
    required Suborder suborder,
  }) async {
    try {
      await _subordersDataManager.delete(suborder.id);
      await _ordersDataManager.updatePrize(orderId: suborder.orderId, prize: -(suborder.prize * suborder.amount));
    } catch (error) {
      Fluttertoast.showToast(
        msg: 'Coś poszło nie tak: $error',
        gravity: ToastGravity.TOP,
        backgroundColor: Colors.red,
      );
      return false;
    }
    Fluttertoast.showToast(
      msg: 'Danie zostało usunięte',
      gravity: ToastGravity.TOP,
      backgroundColor: Colors.green,
    );
    return true;
  }

  Future<bool> saveOrder({
    required String orderId,
    required double prize,
    required String comment,
    required String message,
  }) async {
    final User? user = _firebaseAuth.currentUser;
    final OrderWriteRequest orderWriteRequest = OrderWriteRequest(
      prize: prize,
      inProgress: false,
      userId: user!.uid,
      comment: comment,
    );
    try {
      await sendEmail(
        email: user.email!,
        message: message,
        prize: prize.toStringAsFixed(2),
        comment: comment,
      );
      await _ordersDataManager.saveOrder(
        orderWriteRequest: orderWriteRequest,
        orderId: orderId,
      );
    } catch (error) {
      Fluttertoast.showToast(
        msg: 'Coś poszło nie tak: $error',
        gravity: ToastGravity.TOP,
        backgroundColor: Colors.red,
      );
      return false;
    }
    Fluttertoast.showToast(
      msg: 'Zamówienie zostało złożone',
      gravity: ToastGravity.TOP,
      backgroundColor: Colors.green,
    );
    return true;
  }

  Future<void> sendEmail({
    required String email,
    required String message,
    required String prize,
    required String comment,
  }) async {
    try {
      await _ordersDataManager.sendEmail(
        email: email,
        message: message,
        prize: prize,
        comment: comment,
      );
    } catch (error) {
      Fluttertoast.showToast(
        msg: 'Nie udało się wysłać e-maila',
        gravity: ToastGravity.TOP,
        backgroundColor: Colors.red,
      );
      return;
    }
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
