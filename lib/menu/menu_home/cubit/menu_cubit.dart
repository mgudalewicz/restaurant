import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:restaurant/managers/_managers.dart';
import 'package:restaurant/models/item/item.dart';
import 'package:restaurant/service_locator.dart';

part 'menu_state.dart';

class MenuCubit extends Cubit<MenuState> {
  MenuCubit() : super(const MenuLoadingState());

  final ItemsDataManager _itemsDataManager = sl();

  StreamSubscription<dynamic>? _subscription;

  Future<void> init() async {
    await _itemsDataManager.fetch();

    _subscription = _itemsDataManager.getAllItems().listen((List<Item> items) {
      if (items.isEmpty) {
        emit(const MenuErrorState(error: 'Nastąpił problem z bazą danych'));
        return;
      }
      items.sort((Item a, Item b) => a.prize.compareTo(b.prize));
      emit(MenuLoadedState(items: items));
    });
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
