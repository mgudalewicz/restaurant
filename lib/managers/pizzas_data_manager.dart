import 'package:restaurant/models/pizza/pizza.dart';
import 'package:restaurant/providers/_provider.dart';
import 'package:restaurant/service_locator.dart';

class PizzasDataManager {
  final PizzasDataProvider _pizzasDataProvider = sl();

  Future<void> fetch() async {
    _pizzasDataProvider.fetchAllPizza();
  }

  Stream<List<Pizza>> getAllPizzas() {
    return _pizzasDataProvider.getPizzasStream();
  }
}
