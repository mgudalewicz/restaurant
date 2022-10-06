
import 'dish.dart';

abstract class DishMapper {
  DishMapper._();

  static String getName(Dish dish) {
    switch (dish) {
      case Dish.drinks:
        return 'Napoje';

      case Dish.maincourse:
        return 'Dania główne';

      case Dish.pizza:
        return 'Pizza';

      case Dish.soups:
        return 'Zupy';
    }
  }
}
