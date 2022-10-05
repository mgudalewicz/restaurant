import 'package:restaurant/models/item/item.dart';
import 'package:restaurant/providers/_provider.dart';
import 'package:restaurant/service_locator.dart';

class ItemsDataManager {
  final ItemsDataProvider _drinksDataProvider = sl();

  Future<void> fetch() async {
    _drinksDataProvider.fetchAllItem();
  }

  Stream<List<Item>> getAllItems() {
    return _drinksDataProvider.getItemsStream();
  }
}
