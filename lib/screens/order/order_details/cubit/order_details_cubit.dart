import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:restaurant/managers/_managers.dart';
import 'package:restaurant/models/extras/extra.dart';
import 'package:restaurant/models/item/item.dart';
import 'package:restaurant/models/order/order.dart';
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

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
