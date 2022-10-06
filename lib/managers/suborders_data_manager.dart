import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:restaurant/models/suborder/suborder.dart';
import 'package:restaurant/models/suborder/suborder_write_request.dart';
import 'package:restaurant/providers/_provider.dart';
import 'package:restaurant/service_locator.dart';

class SubordersDataManager {
  final SubordersDataProvider _subordersDataProvider = sl();

  Future<void> fetch() async {
    _subordersDataProvider.fetchAllSuborder();
  }

  Stream<List<Suborder>> getAllItems() {
    return _subordersDataProvider.getSubordersStream();
  }

  Future<void> create(
    SuborderWriteRequest suborderWriteRequest,
  ) async {
    try {
      await _subordersDataProvider.create(
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

  Future<void> delete(
    String suborderId,
  ) async {
    try {
      await _subordersDataProvider.delete(
        suborderId: suborderId,
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
