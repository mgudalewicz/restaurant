import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:restaurant/models/suborder/suborder.dart';
import 'package:restaurant/models/suborder/suborder_write_request.dart';
import 'package:restaurant/providers/_provider.dart';
import 'package:restaurant/service_locator.dart';

class SubordersDataManager {
  final SubordersDataProvider _drinksDataProvider = sl();

  Future<void> fetch() async {
    _drinksDataProvider.fetchAllSuborder();
  }

  Stream<List<Suborder>> getAllItems() {
    return _drinksDataProvider.getSubordersStream();
  }

    Future<void> create(
    SuborderWriteRequest suborderWriteRequest,
  ) async {
    try {
      await _drinksDataProvider.create(
        suborderWriteRequest: suborderWriteRequest,
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
}
