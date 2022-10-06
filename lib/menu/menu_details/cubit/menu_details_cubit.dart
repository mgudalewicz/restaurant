import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:restaurant/managers/_managers.dart';
import 'package:restaurant/models/extras/extra.dart';
import 'package:restaurant/models/item/item.dart';
import 'package:restaurant/service_locator.dart';
import 'package:rxdart/rxdart.dart';

part 'menu_details_state.dart';

class MenuDetailsCubit extends Cubit<MenuDetailsState> {
  MenuDetailsCubit() : super(const MenuDetailsLoadingState());

  final ItemsDataManager _itemsDataManager = sl();
  final ExtrasDataManager _extrasDataManager = sl();

  StreamSubscription<dynamic>? _subscription;

  Future<void> init(String itemId) async {
    await _itemsDataManager.fetch();
    await _extrasDataManager.fetch();

    _subscription = CombineLatestStream.combine2(
      _itemsDataManager.getAllItems(),
      _extrasDataManager.getAllExtras(),
      (
        List<Item> items,
        List<Extra> extras,
      ) {
        final Item item = items.firstWhere((Item item) => item.id == itemId);
        final List<Extra> extrasList = extras.where((Extra extra) => extra.category == item.category).toList();

        emit(MenuDetailsLoadedState(
          item: item,
          extras: extrasList,
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
