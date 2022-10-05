import 'package:restaurant/models/drink/drink.dart';
import 'package:restaurant/providers/_provider.dart';
import 'package:restaurant/service_locator.dart';

class DrinksDataManager {
  final DrinksDataProvider _drinksDataProvider = sl();

  Future<void> fetch() async {
    _drinksDataProvider.fetchAllDrink();
  }

  Stream<List<Drink>> getAllDrinks() {
    return _drinksDataProvider.getDrinksStream();
  }
}
