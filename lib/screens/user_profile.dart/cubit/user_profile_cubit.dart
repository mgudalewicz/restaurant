import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:restaurant/managers/_managers.dart';
import 'package:restaurant/models/order/order.dart';
import 'package:restaurant/service_locator.dart';

part 'user_profile_state.dart';

class UserProfileCubit extends Cubit<UserProfileState> {
  UserProfileCubit() : super(const UserProfileLoadingState());

  final OrdersDataManager _ordersDataManager = sl();
  final FirebaseAuth _firebaseAuth = sl();

  StreamSubscription<dynamic>? subscription;

  Future<void> init() async {
    await _ordersDataManager.fetch();
    final User? user = _firebaseAuth.currentUser;
    if (user == null) {
      Fluttertoast.showToast(
        msg: 'Coś poszło nie tak',
        gravity: ToastGravity.TOP,
        backgroundColor: Colors.red,
      );
      return;
    }
    subscription = _ordersDataManager.getAllItems().listen((
      List<Order> orderList,
    ) {
      emit(UserProfileLoadedState(
        orders: orderList,
        user: user,
      ));
    });
  }

  Future<void> signOut() async {
  await FirebaseAuth.instance.signOut();
}
}
