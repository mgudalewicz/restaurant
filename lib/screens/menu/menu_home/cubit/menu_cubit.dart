import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:restaurant/managers/_managers.dart';
import 'package:restaurant/models/item/item.dart';
import 'package:restaurant/models/order/order.dart';
import 'package:restaurant/models/order/order_write_request.dart';
import 'package:restaurant/service_locator.dart';
import 'package:rxdart/rxdart.dart';

part 'menu_state.dart';

class MenuCubit extends Cubit<MenuState> {
  MenuCubit() : super(const MenuLoadingState());

  final ItemsDataManager _itemsDataManager = sl();
  final OrdersDataManager _ordersDataManager = sl();
  final FirebaseAuth _firebaseAuth = sl();

  StreamSubscription<dynamic>? _subscription;

  Future<void> init() async {
    final User? user = _firebaseAuth.currentUser;
    if (user == null) {
      Fluttertoast.showToast(
        msg: 'Coś poszło nie tak',
        gravity: ToastGravity.TOP,
        backgroundColor: Colors.red,
      );
      return;
    }
    await _itemsDataManager.fetch();
    await _ordersDataManager.fetch();

    _subscription = CombineLatestStream.combine2(
      _itemsDataManager.getAllItems(),
      _ordersDataManager.getAllItems(),
      (
        List<Item> items,
        List<Order> orders,
      ) {
        Order? order;
        final List<Order> allUserOrders =
            orders.where((Order order) => order.userId == user.uid && order.inProgress == true).toList();
        if (allUserOrders.isEmpty) {
          OrderWriteRequest orderWriteRequest = OrderWriteRequest(inProgress: true, prize: 0, userId: user.uid);
          try {
            _ordersDataManager.create(orderWriteRequest);
            _updateState(user);
            return;
          } catch (error) {
            Fluttertoast.showToast(
              msg: 'Coś poszło nie tak: $error',
              gravity: ToastGravity.TOP,
              backgroundColor: Colors.red,
            );
            return;
          }
        } else {
          order = allUserOrders.first;
        }
        items.sort((Item a, Item b) => a.prize.compareTo(b.prize));
        emit(MenuLoadedState(items: items, order: order));
      },
    ).listen((_) {});
  }

  Future<void> _updateState(User user) async {
    await _itemsDataManager.fetch();
    await _ordersDataManager.fetch();
    _subscription = CombineLatestStream.combine2(
      _itemsDataManager.getAllItems(),
      _ordersDataManager.getAllItems(),
      (
        List<Item> items,
        List<Order> orders,
      ) {
        Order order = orders.firstWhere((Order order) => order.userId == user.uid && order.inProgress == true);
        emit(MenuLoadedState(items: items, order: order));
      },
    ).listen((_) {});
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
